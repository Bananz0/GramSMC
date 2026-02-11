//
//  GramControlCenterApp.swift
//  GramControlCenter
//
//  A macOS menu bar app for controlling LG Gram features
//  Based on LG Control Center for Windows
//
//  Confirmed EC Features:
//    - Keyboard Backlight (0x72): Off/Low/High
//    - Silent Mode (0xCF): Normal/Silent
//    - Battery Care Limit (0xBC): 80%/100%
//    - USB Charging (0xBE): Off/On
//    - Fn Lock (0x73): Off/On
//
//  Copyright © 2026 Glen Muthoka Mutinda.
//

import SwiftUI
import IOKit
import Combine
import UserNotifications

@main
struct GramControlCenterApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        // Empty scene - we use menu bar only, Settings opened manually
        Settings {
            EmptyView()
        }
    }
}

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    private var statusItem: NSStatusItem!
    private var gramSMC: GramSMCController!
    private var updateTimer: Timer?
    private var settingsWindow: NSWindow?
    private var popover: NSPopover?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide dock icon (backup, Info.plist should have LSUIElement=true)
        NSApp.setActivationPolicy(.accessory)
        
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            // Try to use custom icon, fallback to SF Symbol
            if let customIcon = NSImage(named: "titlebar_icon_control_center") {
                button.image = customIcon
                button.image?.isTemplate = true
            } else {
                button.image = NSImage(systemSymbolName: "laptopcomputer", accessibilityDescription: "LG Gram Control Center")
                button.image?.isTemplate = true
            }

            button.target = self
            button.action = #selector(handleStatusItemClick(_:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        // Initialize GramSMC controller
        gramSMC = GramSMCController()

        // Configure popover for liquid glass menu UI
        configurePopover()
        
        // Refresh periodically (every 5 seconds)
        updateTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor in
                self.gramSMC.refresh()
            }
        }
        
        // Request notification permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        updateTimer?.invalidate()
    }
    
    @objc private func handleStatusItemClick(_ sender: Any?) {
        guard let event = NSApp.currentEvent else { return }

        switch event.type {
        case .rightMouseUp, .rightMouseDown:
            showContextMenu(event: event)
        default:
            togglePopover()
        }
    }

    private func configurePopover() {
        let popover = NSPopover()
        popover.behavior = .transient
        popover.animates = true
        popover.appearance = NSAppearance(named: .vibrantLight)
        popover.contentViewController = NSHostingController(
            rootView: MenuPopoverView(
                controller: gramSMC,
                onOpenSettings: { [weak self] in
                    self?.closePopover()
                    self?.openSettings()
                },
                onQuit: {
                    NSApp.terminate(nil)
                }
            )
        )
        popover.contentSize = NSSize(width: LGLayout.menuWidth, height: LGLayout.menuHeight)
        self.popover = popover
    }

    private func togglePopover() {
        guard let button = statusItem.button else { return }
        if popover?.isShown == true {
            closePopover()
        } else {
            gramSMC.refresh()
            popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }

    private func closePopover() {
        popover?.performClose(nil)
    }

    private func showContextMenu(event: NSEvent) {
        gramSMC.refresh()
        let menu = makeContextMenu()
        if let button = statusItem.button {
            NSMenu.popUpContextMenu(menu, with: event, for: button)
        }
    }

    private func makeContextMenu() -> NSMenu {
        let menu = NSMenu()
        let isConnected = gramSMC.isConnected

        menu.appearance = NSAppearance(named: .vibrantLight)
        menu.minimumWidth = 220

        // Header with status
        let statusText = isConnected ? "GramSMC Connected" : "GramSMC Not Found"
        let headerItem = NSMenuItem(title: statusText, action: nil, keyEquivalent: "")
        headerItem.isEnabled = false
        menu.addItem(headerItem)

        // Status info (when connected)
        if isConnected {
            let infoItem = NSMenuItem(title: "CPU: \(gramSMC.cpuTemp)°C  •  Fan: \(gramSMC.fanRPM) RPM", action: nil, keyEquivalent: "")
            infoItem.isEnabled = false
            menu.addItem(infoItem)
        }

        menu.addItem(NSMenuItem.separator())

        // Open Settings Window
        let settingsItem = NSMenuItem(title: "Open Settings...", action: #selector(openSettings), keyEquivalent: ",")
        settingsItem.target = self
        if let icon = NSImage(named: "icon_control_n") {
            settingsItem.image = icon
            settingsItem.image?.size = NSSize(width: 16, height: 16)
        }
        menu.addItem(settingsItem)

        menu.addItem(NSMenuItem.separator())

        // Quick Toggles
        let kblLevels = ["Off", "Low", "High"]
        let kblIconNames = ["icon_KBD_off", "icon_KBD_low", "icon_KBD_high"]
        let kblIndex = max(0, min(gramSMC.keyboardBacklight, kblLevels.count - 1))
        let kblItem = NSMenuItem(title: "Keyboard: \(kblLevels[kblIndex])", action: #selector(cycleKeyboardBacklight), keyEquivalent: "")
        kblItem.target = self
        kblItem.isEnabled = isConnected
        if let icon = NSImage(named: kblIconNames[min(kblIndex, kblIconNames.count - 1)]) {
            kblItem.image = icon
            kblItem.image?.size = NSSize(width: 16, height: 16)
        }
        menu.addItem(kblItem)

        let silentItem = NSMenuItem(title: "Silent Mode", action: #selector(toggleSilentMode), keyEquivalent: "")
        silentItem.target = self
        silentItem.state = gramSMC.silentMode ? .on : .off
        silentItem.isEnabled = isConnected
        if let icon = NSImage(named: "icon_pan_slient_n") {
            silentItem.image = icon
            silentItem.image?.size = NSSize(width: 16, height: 16)
        }
        menu.addItem(silentItem)

        let batteryItem = NSMenuItem(title: "Battery Care (\(gramSMC.batteryCareLimit)%)", action: #selector(toggleBatteryCare), keyEquivalent: "")
        batteryItem.target = self
        batteryItem.state = gramSMC.batteryCareLimit == 80 ? .on : .off
        batteryItem.isEnabled = isConnected
        if let icon = NSImage(named: "icon_battery_normal_n") {
            batteryItem.image = icon
            batteryItem.image?.size = NSSize(width: 16, height: 16)
        }
        menu.addItem(batteryItem)

        menu.addItem(NSMenuItem.separator())

        // Quit
        let quitItem = NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        menu.addItem(quitItem)

        menu.delegate = self
        return menu
    }
    
    // MARK: - NSMenuDelegate
    
    func menuWillOpen(_ menu: NSMenu) {
        // Refresh values right before menu is displayed
        gramSMC.refresh()
    }
    
    // MARK: - Quick Actions
    
    @objc func cycleKeyboardBacklight() {
        let newLevel = (gramSMC.keyboardBacklight + 1) % 3
        gramSMC.setKeyboardBacklight(UInt32(newLevel))
    }
    
    @objc func toggleSilentMode() {
        gramSMC.setSilentMode(!gramSMC.silentMode)
    }
    
    @objc func cycleFanMode() {
        let newMode = (gramSMC.fanMode + 1) % 2
        gramSMC.setFanMode(newMode)
    }
    
    @objc func toggleBatteryCare() {
        let newLimit: UInt32 = gramSMC.batteryCareLimit == 80 ? 100 : 80
        gramSMC.setBatteryCareLimit(newLimit)
    }
    
    // MARK: - Settings Window
    
    @objc func openSettings() {
        closePopover()
        if settingsWindow == nil {
            let contentView = SettingsView(controller: gramSMC)
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: LGLayout.windowWidth, height: LGLayout.windowHeight),
                styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView],
                backing: .buffered,
                defer: false
            )
            settingsWindow?.title = "LG Gram Control Center"
            settingsWindow?.titlebarAppearsTransparent = true
            settingsWindow?.titleVisibility = .hidden
            settingsWindow?.titlebarSeparatorStyle = .none
            settingsWindow?.isMovableByWindowBackground = true
            settingsWindow?.isOpaque = false
            settingsWindow?.backgroundColor = .clear // Important for VisualEffectView
            settingsWindow?.contentView = NSHostingView(rootView: contentView)
            settingsWindow?.center()
            settingsWindow?.isReleasedWhenClosed = false
        }
        
        settingsWindow?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}

// MARK: - Settings View (SwiftUI)

struct SettingsView: View {
    @ObservedObject var controller: GramSMCController
    @State private var refreshTimer: Timer?

    var body: some View {
        ZStack {
            // Native macOS Background Blur
            VisualEffectBlur(material: .hudWindow, blendingMode: .behindWindow)
                .edgesIgnoringSafeArea(.all)
                .overlay(LGGlass.backdrop)

            VStack(spacing: 0) {
                headerRow

                ScrollView {
                    Grid(alignment: .top, horizontalSpacing: LGLayout.gutter, verticalSpacing: LGLayout.gutter) {
                        GridRow {
                            fanModeCard
                            batteryCareCard
                            keyboardBacklightCard
                        }
                        GridRow {
                            usbChargingCard
                            touchpadCard
                            fnLockCard
                        }
                        GridRow {
                            readerModeCard
                            Color.clear
                            Color.clear
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, LGLayout.padding)
                    .padding(.bottom, LGLayout.padding)
                }
                .scrollDisabled(true)

                // Footer with versions (fixed at bottom)
                HStack(spacing: 16) {
                    Text("App: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")")
                        .font(LGFont.caption)
                        .foregroundColor(LGColor.textSecondary)

                    Text("Kext: \(controller.kextVersion)")
                        .font(LGFont.caption)
                        .foregroundColor(LGColor.textSecondary)

                    Text("Daemon: 1.5.0")
                        .font(LGFont.caption)
                        .foregroundColor(LGColor.textSecondary)

                    Spacer()
                }
                .padding(.horizontal, LGLayout.padding)
                .padding(.vertical, 8)
                .background(
                    LGGlassSurface(
                        cornerRadius: 0,
                        material: LGGlass.footerMaterial,
                        showsShadow: false
                    )
                )
                .overlay(
                    Rectangle()
                        .fill(LGColor.glassDivider)
                        .frame(height: 1),
                    alignment: .top
                )
            }
        }
        .frame(width: LGLayout.windowWidth, height: LGLayout.windowHeight)
        .onAppear {
            refreshTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                Task { @MainActor in
                    controller.refresh()
                }
            }
        }
        .onDisappear {
            refreshTimer?.invalidate()
        }
    }

    private var headerRow: some View {
        ZStack {
            // Left Side: Status
            HStack(spacing: 12) {
                if let logo = NSImage(named: "title_icon_controlcenter") {
                    Image(nsImage: logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 18)
                }

                HStack(spacing: 6) {
                    Circle()
                        .fill(controller.isConnected ? LGColor.statusGreen : LGColor.statusRed)
                        .frame(width: 8, height: 8)
                    Text(controller.isConnected ? "SMC Connected" : "SMC Disconnected")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.textSecondary)
                }
                
                Spacer()
            }

            // Center: LG gram Wordmark
            if let wordmark = NSImage(named: "LG_Gram_wordmark") {
                Image(nsImage: wordmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 16)
            }

            // Right Side: Stats & Close
            HStack(spacing: 16) {
                Spacer()
                
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "cpu")
                            .foregroundColor(LGColor.magenta)
                        Text("\(controller.cpuTemp)°C")
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "fanblades")
                            .foregroundColor(LGColor.magenta)
                        Text("\(controller.fanRPM) RPM")
                    }
                }
                .font(LGFont.label)
                .foregroundColor(LGColor.text)

                Button(action: { NSApp.keyWindow?.close() }) {
                    Image(nsImage: NSImage(named: "popup_icon_close") ?? NSImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .padding(6)
                        .background(Circle().fill(Color.white.opacity(0.1)))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, LGLayout.padding)
        .padding(.top, 16)
        .padding(.bottom, 12)
    }

    private var fanModeCard: some View {
        LGCard(title: "Fan Mode", icon: "icon_pan_n") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Control fan behavior")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                LGSegmentedControl(
                    options: [(0, "Normal"), (1, "Silent")],
                    selection: Binding(
                        get: { Int(controller.fanMode) },
                        set: { controller.setFanMode(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )
            }
        }
    }

    private var batteryCareCard: some View {
        LGCard(title: "Battery Care", icon: "icon_battery_normal_n") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Limit charging to extend battery lifespan")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                LGSegmentedControl(
                    options: [(80, "80%"), (100, "100%")],
                    selection: Binding(
                        get: { controller.batteryCareLimit },
                        set: { controller.setBatteryCareLimit(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )

                Text("80% recommended for daily use")
                    .font(LGFont.label)
                    .foregroundColor(LGColor.textSecondary)
            }
        }
    }

    private var usbChargingCard: some View {
        LGCard(title: "USB Charging", icon: "icon_usb_n") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Charge devices when laptop is off")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                Toggle(isOn: Binding(
                    get: { controller.usbCharging },
                    set: { controller.setUSBCharging($0) }
                )) {
                    Text("Always On")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }
        }
    }

    private var keyboardBacklightCard: some View {
        LGCard(title: "Keyboard Backlight", icon: "icon_KBD_high") {
            VStack(alignment: .leading, spacing: 12) {
                LGSegmentedControl(
                    options: [(0, "Off"), (1, "Low"), (2, "High")],
                    selection: Binding(
                        get: { controller.keyboardBacklight },
                        set: { controller.setKeyboardBacklight(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )
            }
        }
    }

    private var fnLockCard: some View {
        LGCard(title: "Fn Lock", icon: "icon_hotkey_n") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Use F1-F12 directly without Fn key")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                Toggle(isOn: Binding(
                    get: { controller.fnLock },
                    set: { controller.setFnLock($0) }
                )) {
                    Text("Enabled")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }
        }
    }

    private var readerModeCard: some View {
        LGCard(title: "Reader Mode", icon: "icon_display_Kelvin") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Reduce blue light (Fn+F9)")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                Toggle(isOn: Binding(
                    get: { controller.nightShiftEnabled },
                    set: { controller.setNightShift($0) }
                )) {
                    Text("Night Shift")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(LGToggleStyle(isEnabled: controller.nightShiftSupported))
                .disabled(!controller.nightShiftSupported)
            }
        }
    }

    private var touchpadCard: some View {
        LGCard(title: "Touchpad", icon: "icon_touchpad_n") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Enable or disable touchpad")
                    .font(LGFont.caption)
                    .foregroundColor(LGColor.textSecondary)

                Toggle(isOn: Binding(
                    get: { controller.touchpadEnabled },
                    set: { controller.setTouchpad($0) }
                )) {
                    Text("Touchpad")
                        .font(LGFont.body)
                        .foregroundColor(LGColor.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }
        }
    }
}

// MARK: - Menu Bar Popover (Liquid Glass)

struct MenuPopoverView: View {
    @ObservedObject var controller: GramSMCController
    let onOpenSettings: () -> Void
    let onQuit: () -> Void

    var body: some View {
        ZStack {
            VisualEffectBlur(material: .menu, blendingMode: .behindWindow)
                .edgesIgnoringSafeArea(.all)
                .overlay(LGGlass.backdrop)

            VStack(spacing: 12) {
                headerRow

                ScrollView {
                    VStack(spacing: 12) {
                        quickControls
                    }
                    .padding(.vertical, 2)
                }

                footerRow
            }
            .padding(LGLayout.menuPadding)
        }
        .frame(width: LGLayout.menuWidth, height: LGLayout.menuHeight)
    }

    private var headerRow: some View {
        ZStack {
            // Left Side: Icon + Status
            HStack(spacing: 8) {
                if let logo = NSImage(named: "title_icon_controlcenter") {
                    Image(nsImage: logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 14)
                }

                Circle()
                    .fill(controller.isConnected ? LGColor.statusGreen : LGColor.statusRed)
                    .frame(width: 6, height: 6)
                Spacer()
            }

            // Center: LG gram Wordmark
            if let wordmark = NSImage(named: "LG_Gram_wordmark") {
                Image(nsImage: wordmark)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 12)
            }

            // Right Side: Stats
            HStack(spacing: 8) {
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "cpu")
                    Text("\(controller.cpuTemp)°C")
                }
                Divider()
                    .frame(height: 10)
                    .background(LGColor.glassDivider)
                HStack(spacing: 4) {
                    Image(systemName: "fanblades")
                    Text("\(controller.fanRPM) RPM")
                }
            }
            .font(LGFont.label)
            .foregroundColor(LGColor.textSecondary)
        }
        .padding(10)
        .background(
            LGGlassSurface(
                cornerRadius: LGLayout.cornerRadius,
                material: LGGlass.cardMaterial,
                showsShadow: false
            )
        )
    }

    private var quickControls: some View {
        VStack(alignment: .leading, spacing: LGLayout.gutter) {
            controlRow(title: "Fan Mode", icon: "icon_pan_n") {
                LGSegmentedControl(
                    options: [(0, "Normal"), (1, "Silent")],
                    selection: Binding(
                        get: { Int(controller.fanMode) },
                        set: { controller.setFanMode(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )
                .frame(width: 160)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "Battery Care", icon: "icon_battery_normal_n") {
                LGSegmentedControl(
                    options: [(80, "80%"), (100, "100%")],
                    selection: Binding(
                        get: { controller.batteryCareLimit },
                        set: { controller.setBatteryCareLimit(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )
                .frame(width: 160)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "USB", subtitle: "Always On", icon: "icon_usb_n") {
                Toggle("", isOn: Binding(
                    get: { controller.usbCharging },
                    set: { controller.setUSBCharging($0) }
                ))
                .labelsHidden()
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "Keyboard", icon: "icon_KBD_high") {
                LGSegmentedControl(
                    options: [(0, "Off"), (1, "Low"), (2, "High")],
                    selection: Binding(
                        get: { controller.keyboardBacklight },
                        set: { controller.setKeyboardBacklight(UInt32($0)) }
                    ),
                    isEnabled: controller.isConnected
                )
                .frame(width: 180)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "Touchpad", icon: "icon_touchpad_n") {
                Toggle("", isOn: Binding(
                    get: { controller.touchpadEnabled },
                    set: { controller.setTouchpad($0) }
                ))
                .labelsHidden()
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "Fn Lock", icon: "icon_hotkey_n") {
                Toggle("", isOn: Binding(
                    get: { controller.fnLock },
                    set: { controller.setFnLock($0) }
                ))
                .labelsHidden()
                .toggleStyle(LGToggleStyle(isEnabled: controller.isConnected))
                .disabled(!controller.isConnected)
            }

            Divider().background(LGColor.glassDivider)

            controlRow(title: "Reader", icon: "icon_display_Kelvin") {
                Toggle("", isOn: Binding(
                    get: { controller.nightShiftEnabled },
                    set: { controller.setNightShift($0) }
                ))
                .labelsHidden()
                .toggleStyle(LGToggleStyle(isEnabled: controller.nightShiftSupported))
                .disabled(!controller.nightShiftSupported)
            }
        }
        .padding(12)
        .background(
            LGGlassSurface(
                cornerRadius: LGLayout.cornerRadius,
                material: LGGlass.cardMaterial,
                showsShadow: false
            )
        )
    }

    private var footerRow: some View {
        HStack(spacing: 8) {
            Button("Open Settings") {
                onOpenSettings()
            }
            .buttonStyle(LGGlassButtonStyle(isPrimary: true))

            Button("Quit") {
                onQuit()
            }
            .buttonStyle(LGGlassButtonStyle())
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }

    private func controlRow<Control: View>(
        title: String,
        subtitle: String? = nil,
        icon: String? = nil,
        @ViewBuilder control: () -> Control
    ) -> some View {
        HStack(alignment: .center, spacing: 12) {
            if let iconName = icon {
                if let customIcon = NSImage(named: iconName) {
                    Image(nsImage: customIcon)
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(LGFont.body)
                    .foregroundColor(LGColor.text)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(LGFont.caption)
                        .foregroundColor(LGColor.textSecondary)
                }
            }

            Spacer(minLength: 8)

            control()
        }
    }
}

// MARK: - GramSMC IOKit Controller

@MainActor
class GramSMCController: ObservableObject {
    @Published var capabilities: UInt32 = 0
    @Published var keyboardBacklight: Int = 0  // 0=Off, 1=Low, 2=High
    @Published var fanMode: UInt32 = 0          // 0=Normal, 1=Silent
    @Published var batteryCareLimit: Int = 100
    @Published var usbCharging: Bool = false
    @Published var fnLock: Bool = false
    @Published var touchpadEnabled: Bool = true
    @Published var cpuTemp: Int = 0
    @Published var fanRPM: Int = 0
    @Published var isConnected: Bool = false
    @Published var kextVersion: String = "Unknown"
    @Published var nightShiftEnabled: Bool = false
    @Published var nightShiftSupported: Bool = false
    @Published var readerMode: Bool = false
    
    // Night Shift client (private CoreBrightness API)
    private var blueLightClient: CBBlueLightClient?
    
    // UserDefaults Keys
    private enum SettingsKey: String {
        case keyboardBacklight = "GramSMC_KeyboardBacklight"
        case fanMode = "GramSMC_FanMode"
        case batteryCareLimit = "GramSMC_BatteryCareLimit"
        case usbCharging = "GramSMC_USBCharging"
        case fnLock = "GramSMC_FnLock"
    }
    
    // Computed property for fan mode string
    var fanModeString: String {
        switch fanMode {
        case 0: return "Normal"
        case 1: return "Silent"
        default: return "Unknown"
        }
    }
    
    private var service: io_service_t = 0
    private var notificationPort: IONotificationPortRef?
    private var notificationObject: io_object_t = 0
    
    init() {
        // Initialize Night Shift client
        blueLightClient = CBBlueLightClient()
        nightShiftSupported = CBBlueLightClient.supportsBlueLightReduction()
        refreshNightShift()
        
        connect()
        refresh()
        
        // Load saved settings and apply to hardware
        loadSettings()
    }
    
    // MARK: - Settings Persistence
    
    func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(keyboardBacklight, forKey: SettingsKey.keyboardBacklight.rawValue)
        defaults.set(fanMode, forKey: SettingsKey.fanMode.rawValue)
        defaults.set(batteryCareLimit, forKey: SettingsKey.batteryCareLimit.rawValue)
        defaults.set(usbCharging, forKey: SettingsKey.usbCharging.rawValue)
        defaults.set(fnLock, forKey: SettingsKey.fnLock.rawValue)
    }
    
    func loadSettings() {
        let defaults = UserDefaults.standard
        
        // Only load and apply if we have saved values (check if key exists)
        if defaults.object(forKey: SettingsKey.keyboardBacklight.rawValue) != nil {
            let savedKbl = defaults.integer(forKey: SettingsKey.keyboardBacklight.rawValue)
            if savedKbl != keyboardBacklight {
                setKeyboardBacklight(UInt32(savedKbl))
            }
        }
        
        if defaults.object(forKey: SettingsKey.fanMode.rawValue) != nil {
            let savedFanMode = UInt32(defaults.integer(forKey: SettingsKey.fanMode.rawValue))
            if savedFanMode != fanMode {
                setFanMode(savedFanMode)
            }
        }
        
        if defaults.object(forKey: SettingsKey.batteryCareLimit.rawValue) != nil {
            let savedBatteryLimit = defaults.integer(forKey: SettingsKey.batteryCareLimit.rawValue)
            if savedBatteryLimit != batteryCareLimit && (savedBatteryLimit == 80 || savedBatteryLimit == 100) {
                setBatteryCareLimit(UInt32(savedBatteryLimit))
            }
        }
        
        if defaults.object(forKey: SettingsKey.usbCharging.rawValue) != nil {
            let savedUSB = defaults.bool(forKey: SettingsKey.usbCharging.rawValue)
            if savedUSB != usbCharging {
                setUSBCharging(savedUSB)
            }
        }
        
        if defaults.object(forKey: SettingsKey.fnLock.rawValue) != nil {
            let savedFnLock = defaults.bool(forKey: SettingsKey.fnLock.rawValue)
            if savedFnLock != fnLock {
                setFnLock(savedFnLock)
            }
        }
    }
    
    deinit {
        if notificationObject != 0 {
            IOObjectRelease(notificationObject)
        }
        if let port = notificationPort {
            IONotificationPortDestroy(port)
        }
        if service != 0 {
            IOObjectRelease(service)
        }
    }
    
    func connect() {
        let matching = IOServiceMatching("GramSMC")
        service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
        
        if service != 0 {
            isConnected = true
            setupNotifications()
            // Read version
            if let version = getStringProperty("GramSMC-Version") {
                kextVersion = version
            }
        } else {
            isConnected = false
        }
    }
    
    func setupNotifications() {
        // Create notification port
        notificationPort = IONotificationPortCreate(kIOMainPortDefault)
        guard let port = notificationPort else { return }
        
        // Add to RunLoop
        let runLoopSource = IONotificationPortGetRunLoopSource(port)
        CFRunLoopAddSource(CFRunLoopGetMain(), runLoopSource!.takeUnretainedValue(), .defaultMode)
        
        // Register for general interest (messages from kext)
        // Pass 'self' as refCon
        let refCon = Unmanaged.passUnretained(self).toOpaque()
        
        let req = IOServiceAddInterestNotification(
            port,
            service,
            kIOGeneralInterest,
            { (refCon, service, messageType, messageArgument) in
                guard let refCon = refCon else { return }
                let controller = Unmanaged<GramSMCController>.fromOpaque(refCon).takeUnretainedValue()
                
                // In our Kext, we pass the Event Code as 'messageType'
                // messageArgument is unused (0)
                let eventCode = messageType
                
                Task { @MainActor in
                    controller.handleEvent(code: eventCode)
                }
            },
            refCon,
            &notificationObject
        )
        
        if req != KERN_SUCCESS {
            print("Failed to register for notifications")
        }
    }
    
    func refreshReaderMode() {
        readerMode = getBoolProperty("ReaderMode")
    }
    
    func handleEvent(code: UInt32) {
        print("Received Event: 0x\(String(format: "%02X", code))")
        
        switch code {
        case 0x10: // Brightness Down (Native+App)
            // Just update UI state, do not set back to hardware
            if keyboardBacklight > 0 { keyboardBacklight -= 1 }
            showOSD(title: "Keyboard Brightness", level: keyboardBacklight, max: 2)
            
        case 0x11: // Brightness Up (Native+App)
             // Just update UI state
            if keyboardBacklight < 2 { keyboardBacklight += 1 }
            showOSD(title: "Keyboard Brightness", level: keyboardBacklight, max: 2)
            
        case 0xC0: keyboardBacklight = 0 // Off
        case 0xC1: keyboardBacklight = 1 // Low
        case 0xC2: keyboardBacklight = 2 // High
            
        case 0x369: // Touchpad Toggle (Native code passed through) or 0xE4
             // Just generic OSD or notification
             showNotification(title: "Touchpad", message: "Toggled")
             
        case 0xE4: // Legacy Touchpad code
             showNotification(title: "Touchpad", message: "Toggled")

        case 0x7D: // Airplane Mode
             showNotification(title: "Airplane Mode", message: "Toggled")
             
        // Reader Mode
        case 0xF9, 0x69:
             refreshReaderMode() // Poll state
             setNightShift(!nightShiftEnabled) // Toggle Night Shift
             showNotification(title: "Reader Mode", message: "Toggled - Night Shift \(nightShiftEnabled ? "On" : "Off")")

        default:
            // Refresh generic state for other keys
            refresh()
        }
    }
    
    func showOSD(title: String, level: Int, max: Int) {
        // Simple OSD implementation or placeholder
        // Using built-in macOS OSD is hard without private APIs, so we use a Notification for now
        // or rely on the Menu Bar icon updating.
        // Ideally we would show a HUD window here.
    }
    
    func showNotification(title: String, message: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error showing notification: \(error.localizedDescription)")
            }
        }
    }


    
    func refresh() {
        if !isConnected {
            connect()
        }
        
        guard service != 0 else {
            isConnected = false
            return
        }
        
        capabilities = getProperty("Capabilities") ?? 0
        keyboardBacklight = Int(getProperty("KeyboardBacklight") ?? 0)
        fanMode = getProperty("FanMode") ?? 0
        batteryCareLimit = Int(getProperty("BatteryCareLimit") ?? 100)
        usbCharging = getBoolProperty("USBCharging")
        fnLock = getBoolProperty("FnLock")
        touchpadEnabled = getBoolProperty("IsTouchpadEnabled")
        cpuTemp = Int(getProperty("CPUTemp") ?? 0)
        fanRPM = Int(getProperty("FanRPM") ?? 0)
        kextVersion = getStringProperty("GramSMC-Version") ?? "Unknown"
        isConnected = true
    }
    


    func getProperty(_ name: String) -> UInt32? {
        guard service != 0 else { return nil }
        if let prop = IORegistryEntryCreateCFProperty(service, name as CFString, kCFAllocatorDefault, 0) {
            if let number = prop.takeRetainedValue() as? NSNumber {
                return number.uint32Value
            }
        }
        return nil
    }
    
    func getBoolProperty(_ name: String) -> Bool {
        guard service != 0 else { return false }
        if let prop = IORegistryEntryCreateCFProperty(service, name as CFString, kCFAllocatorDefault, 0) {
            if let number = prop.takeRetainedValue() as? NSNumber {
                return number.boolValue
            }
        }
        return false
    }
    
    func getStringProperty(_ name: String) -> String? {
        guard service != 0 else { return nil }
        if let prop = IORegistryEntryCreateCFProperty(service, name as CFString, kCFAllocatorDefault, 0) {
            if let str = prop.takeRetainedValue() as? String {
                return str
            }
        }
        return nil
    }
    
    // MARK: - Setters
    
    func setKeyboardBacklight(_ level: UInt32) {
        guard service != 0 else { return }
        keyboardBacklight = Int(level)
        setProperty("KeyboardBacklight", value: level)
        saveSettings()
    }
    
    func setSilentMode(_ enabled: Bool) {
        guard service != 0 else { return }
        fanMode = enabled ? 1 : 0
        setProperty("FanMode", value: fanMode)
    }
    
    func setFanMode(_ mode: UInt32) {
        guard service != 0 else { return }
        fanMode = mode
        setProperty("FanMode", value: mode)
        saveSettings()
    }
    
    // Computed property for backwards compatibility
    var silentMode: Bool {
        get { fanMode == 1 }
        set { setFanMode(newValue ? 1 : 0) }
    }
    
    func setBatteryCareLimit(_ limit: UInt32) {
        guard service != 0 else { return }
        batteryCareLimit = Int(limit)
        setProperty("BatteryCareLimit", value: limit)
        saveSettings()
    }
    
    func setUSBCharging(_ enabled: Bool) {
        guard service != 0 else { return }
        usbCharging = enabled
        setProperty("USBCharging", value: enabled ? 1 : 0)
        saveSettings()
    }
    
    func setFnLock(_ enabled: Bool) {
        guard service != 0 else { return }
        fnLock = enabled
        setProperty("FnLock", value: enabled ? 1 : 0)
        saveSettings()
    }
    
    func setTouchpad(_ enabled: Bool) {
        guard service != 0 else { return }
        touchpadEnabled = enabled
        setProperty("IsTouchpadEnabled", value: enabled ? 1 : 0)
    }
    
    private func setProperty(_ name: String, value: UInt32) {
        guard service != 0 else { return }
        let number = NSNumber(value: value)
        IORegistryEntrySetCFProperty(service, name as CFString, number)
    }
    
    // MARK: - Night Shift Control (via CBBlueLightClient)
    
    func refreshNightShift() {
        guard nightShiftSupported, let client = blueLightClient else { return }
        var status = GStatus()
        if client.getBlueLightStatus(&status) {
            nightShiftEnabled = status.enabled.boolValue
        }
    }
    
    func setNightShift(_ enabled: Bool) {
        guard nightShiftSupported, let client = blueLightClient else { return }
        nightShiftEnabled = enabled
        client.setEnabled(enabled)
    }
    
    func toggleNightShift() {
        setNightShift(!nightShiftEnabled)
    }
}

// Global C-function callback for IOService
func gramSMCNotificationCallback(refCon: UnsafeMutableRawPointer?, service: io_service_t, messageType: UInt32, messageArgument: UnsafeMutableRawPointer?) {
    guard let refCon = refCon else { return }
    let controller = Unmanaged<GramSMCController>.fromOpaque(refCon).takeUnretainedValue()
    
    // In our Kext, we pass the Event Code as 'messageType'
    // messageArgument is unused (0)
    let eventCode = messageType
    
    Task { @MainActor in
        controller.handleEvent(code: eventCode)
    }
}
