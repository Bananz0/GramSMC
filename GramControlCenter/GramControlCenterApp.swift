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
//  Copyright © 2024-2025 GramSMC contributors.
//

import SwiftUI
import IOKit
import Combine

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

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var gramSMC: GramSMCController!
    var updateTimer: Timer?
    var settingsWindow: NSWindow?
    
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
        }
        
        // Initialize GramSMC controller
        gramSMC = GramSMCController()
        
        // Build initial menu
        updateMenu()
        
        // Refresh periodically (every 5 seconds)
        updateTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.gramSMC.refresh()
            self?.updateMenu()
        }
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        updateTimer?.invalidate()
    }
    
    func updateMenu() {
        let menu = NSMenu()
        let isConnected = gramSMC.isConnected
        
        // Header with status
        let statusText = isConnected ? "✓ GramSMC Connected" : "✗ GramSMC Not Found"
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
        let kblItem = NSMenuItem(title: "Keyboard: \(kblLevels[gramSMC.keyboardBacklight])", action: #selector(cycleKeyboardBacklight), keyEquivalent: "")
        kblItem.target = self
        kblItem.isEnabled = isConnected
        if let icon = NSImage(named: kblIconNames[Int(gramSMC.keyboardBacklight) % 3]) {
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
        
        statusItem.menu = menu
    }
    
    // MARK: - Quick Actions
    
    @objc func cycleKeyboardBacklight() {
        let newLevel = (gramSMC.keyboardBacklight + 1) % 3
        gramSMC.setKeyboardBacklight(UInt32(newLevel))
        updateMenu()
    }
    
    @objc func toggleSilentMode() {
        gramSMC.setSilentMode(!gramSMC.silentMode)
        updateMenu()
    }
    
    @objc func cycleFanMode() {
        let newMode = (gramSMC.fanMode + 1) % 3
        gramSMC.setFanMode(newMode)
        updateMenu()
    }
    
    @objc func toggleBatteryCare() {
        let newLimit: UInt32 = gramSMC.batteryCareLimit == 80 ? 100 : 80
        gramSMC.setBatteryCareLimit(newLimit)
        updateMenu()
    }
    
    // MARK: - Settings Window
    
    @objc func openSettings() {
        if settingsWindow == nil {
            let contentView = SettingsView(controller: gramSMC)
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 500, height: 450),
                styleMask: [.titled, .closable, .miniaturizable],
                backing: .buffered,
                defer: false
            )
            settingsWindow?.title = "LG Gram Control Center"
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
        VStack(spacing: 0) {
            // Header
            HStack {
                if let headerIcon = NSImage(named: "titlebar_icon_control_center") {
                    Image(nsImage: headerIcon)
                        .resizable()
                        .frame(width: 28, height: 28)
                } else {
                    Image(systemName: "laptopcomputer")
                        .font(.system(size: 28))
                        .foregroundColor(.accentColor)
                }
                Text("LG Gram Control Center")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Circle()
                    .fill(controller.isConnected ? Color.green : Color.red)
                    .frame(width: 10, height: 10)
                Text(controller.isConnected ? "Connected" : "Disconnected")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // System Section
                    SettingsSection(title: "System", icon: "icon_control_n") {
                        // Fan Mode (replaces simple Silent Mode toggle)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                if let icon = NSImage(named: "icon_pan_n") {
                                    Image(nsImage: icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                } else {
                                    Image(systemName: "fan")
                                        .foregroundColor(.blue)
                                }
                                Text("Fan Mode")
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            Text("Control fan behavior: Optimal, Silent, or Performance")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Picker("", selection: Binding(
                                get: { Int(controller.fanMode) },
                                set: { controller.setFanMode(UInt32($0)) }
                            )) {
                                Text("Optimal").tag(0)
                                Text("Silent").tag(1)
                                Text("Performance").tag(2)
                            }
                            .pickerStyle(.segmented)
                            .disabled(!controller.isConnected)
                        }
                        
                        Divider()
                        
                        // Battery Care
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                if let icon = NSImage(named: "icon_battery_normal_n") {
                                    Image(nsImage: icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                } else {
                                    Image(systemName: "battery.75")
                                        .foregroundColor(.green)
                                }
                                Text("Battery Care Limit")
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            Text("Limit charging to extend battery lifespan")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Picker("", selection: Binding(
                                get: { controller.batteryCareLimit },
                                set: { controller.setBatteryCareLimit(UInt32($0)) }
                            )) {
                                Text("80% (Recommended)").tag(80)
                                Text("100% (Full Charge)").tag(100)
                            }
                            .pickerStyle(.segmented)
                            .disabled(!controller.isConnected)
                        }
                        
                        Divider()
                        
                        // USB Charging
                        ToggleRow(
                            title: "USB Charging (Always On)",
                            subtitle: "Charge devices via USB when laptop is off or sleeping",
                            icon: "icon_usb_n",
                            isOn: Binding(
                                get: { controller.usbCharging },
                                set: { controller.setUSBCharging($0) }
                            ),
                            isEnabled: controller.isConnected
                        )
                    }
                    
                    // Input Section
                    SettingsSection(title: "Input", icon: "icon_KBD_high") {
                        // Keyboard Backlight
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                if let icon = NSImage(named: "icon_KBD_high") {
                                    Image(nsImage: icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                } else {
                                    Image(systemName: "light.max")
                                        .foregroundColor(.yellow)
                                }
                                Text("Keyboard Backlight")
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            
                            Picker("", selection: Binding(
                                get: { controller.keyboardBacklight },
                                set: { controller.setKeyboardBacklight(UInt32($0)) }
                            )) {
                                Text("Off").tag(0)
                                Text("Low").tag(1)
                                Text("High").tag(2)
                            }
                            .pickerStyle(.segmented)
                            .disabled(!controller.isConnected)
                        }
                        
                        Divider()
                        
                        // Fn Lock
                        ToggleRow(
                            title: "Fn Lock",
                            subtitle: "Use F1-F12 keys directly without holding Fn",
                            icon: "icon_hotkey_n",
                            isOn: Binding(
                                get: { controller.fnLock },
                                set: { controller.setFnLock($0) }
                            ),
                            isEnabled: controller.isConnected
                        )
                    }
                    
                    // Display Section
                    SettingsSection(title: "Display", icon: "icon_display_n") {
                        HStack {
                            if let icon = NSImage(named: "icon_display_Kelvin") {
                                Image(nsImage: icon)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } else {
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.orange)
                            }
                            VStack(alignment: .leading) {
                                Text("Night Light")
                                    .fontWeight(.medium)
                                Text("Reduce blue light for comfortable reading")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Button("Open Display Settings") {
                                if let url = URL(string: "x-apple.systempreferences:com.apple.preference.displays") {
                                    NSWorkspace.shared.open(url)
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    
                    // Status Section
                    if controller.isConnected {
                        SettingsSection(title: "Status", icon: "icon_info_normal") {
                            HStack {
                                StatusCard(
                                    title: "CPU Temperature",
                                    value: "\(controller.cpuTemp)°C",
                                    icon: "thermometer.medium",
                                    color: controller.cpuTemp > 70 ? .red : (controller.cpuTemp > 50 ? .orange : .green)
                                )
                                StatusCard(
                                    title: "Fan Speed",
                                    value: "\(controller.fanRPM) RPM",
                                    icon: "icon_pan_n",
                                    color: controller.fanRPM > 3000 ? .orange : .blue
                                )
                            }
                        }
                    }
                    
                    // About Section
                    SettingsSection(title: "About", icon: "icon_info_normal") {
                        HStack {
                            Text("App Version")
                            Spacer()
                            Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Kext Version")
                            Spacer()
                            Text(controller.kextVersion)
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Daemon Version")
                            Spacer()
                            Text("2.0.0")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
            }
            
            // Footer
            Divider()
            HStack {
                Text("GramSMC v2.0.0")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    if let url = URL(string: "https://github.com/") {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Text("Based on LG Control Center")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .frame(minWidth: 500, minHeight: 450)
        .onAppear {
            // Refresh data periodically
            refreshTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
                controller.refresh()
            }
        }
        .onDisappear {
            refreshTimer?.invalidate()
        }
    }
}

// MARK: - UI Components

struct SettingsSection<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                if let customIcon = NSImage(named: icon) {
                    Image(nsImage: customIcon)
                        .resizable()
                        .frame(width: 16, height: 16)
                } else {
                    Image(systemName: icon)
                        .foregroundColor(.accentColor)
                }
                Text(title)
                    .font(.headline)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                content
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(10)
        }
    }
}

struct ToggleRow: View {
    let title: String
    let subtitle: String
    let icon: String
    @Binding var isOn: Bool
    let isEnabled: Bool
    
    var body: some View {
        HStack {
            if let customIcon = NSImage(named: icon) {
                Image(nsImage: customIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
            } else {
                Image(systemName: icon)
                    .foregroundColor(.accentColor)
            }
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.medium)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Toggle("", isOn: $isOn)
                .toggleStyle(.switch)
                .disabled(!isEnabled)
        }
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            if let customIcon = NSImage(named: icon) {
                Image(nsImage: customIcon)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(color)
            } else {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
            }
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
    }
}

// MARK: - GramSMC IOKit Controller

class GramSMCController: ObservableObject {
    @Published var capabilities: UInt32 = 0
    @Published var keyboardBacklight: Int = 0  // 0=Off, 1=Low, 2=High
    @Published var fanMode: UInt32 = 0          // 0=Optimal, 1=Silent, 2=Performance
    @Published var batteryCareLimit: Int = 100
    @Published var usbCharging: Bool = false
    @Published var fnLock: Bool = false
    @Published var cpuTemp: Int = 0
    @Published var fanRPM: Int = 0
    @Published var isConnected: Bool = false
    @Published var kextVersion: String = "Unknown"
    
    // Computed property for fan mode string
    var fanModeString: String {
        switch fanMode {
        case 0: return "Optimal"
        case 1: return "Silent"
        case 2: return "Performance"
        default: return "Unknown"
        }
    }
    
    private var service: io_service_t = 0
    
    init() {
        connect()
        refresh()
    }
    
    deinit {
        if service != 0 {
            IOObjectRelease(service)
        }
    }
    
    func connect() {
        if service != 0 {
            IOObjectRelease(service)
            service = 0
        }
        
        let matching = IOServiceMatching("GramSMC")
        service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
        
        if service == 0 {
            print("GramSMC service not found")
            isConnected = false
        } else {
            print("GramSMC connected")
            isConnected = true
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
        
        DispatchQueue.main.async { [self] in
            capabilities = getProperty("Capabilities") ?? 0
            keyboardBacklight = Int(getProperty("KeyboardBacklight") ?? 0)
            fanMode = getProperty("FanMode") ?? 0
            batteryCareLimit = Int(getProperty("BatteryCareLimit") ?? 100)
            usbCharging = getBoolProperty("USBCharging")
            fnLock = getBoolProperty("FnLock")
            cpuTemp = Int(getProperty("CPUTemp") ?? 0)
            fanRPM = Int(getProperty("FanRPM") ?? 0)
            kextVersion = getStringProperty("GramSMC-Version") ?? "Unknown"
            isConnected = true
        }
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
    }
    
    func setUSBCharging(_ enabled: Bool) {
        guard service != 0 else { return }
        usbCharging = enabled
        setProperty("USBCharging", value: enabled ? 1 : 0)
    }
    
    func setFnLock(_ enabled: Bool) {
        guard service != 0 else { return }
        fnLock = enabled
        setProperty("FnLock", value: enabled ? 1 : 0)
    }
    
    private func setProperty(_ name: String, value: UInt32) {
        guard service != 0 else { return }
        let number = NSNumber(value: value)
        IORegistryEntrySetCFProperty(service, name as CFString, number)
    }
}
