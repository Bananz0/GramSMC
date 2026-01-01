//
//  GramControlCenterApp.swift
//  GramControlCenter
//
//  A macOS menu bar app for controlling LG Gram features
//  Based on LG Control Center for Windows
//
//  Copyright © 2024-2025 GramSMC contributors.
//

import SwiftUI
import IOKit

@main
struct GramControlCenterApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var gramSMC: GramSMCController!
    var updateTimer: Timer?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "laptopcomputer", accessibilityDescription: "LG Gram Control Center")
            button.image?.isTemplate = true
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
        
        // Header
        let headerItem = NSMenuItem(title: "LG Gram Control Center", action: nil, keyEquivalent: "")
        headerItem.isEnabled = false
        menu.addItem(headerItem)
        
        // Connection status
        let statusText = isConnected ? "✓ Connected to GramSMC" : "✗ GramSMC not found"
        let statusMenuItem = NSMenuItem(title: statusText, action: nil, keyEquivalent: "")
        statusMenuItem.isEnabled = false
        menu.addItem(statusMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        // Fan Mode submenu
        let fanMenu = NSMenu()
        let fanModes = ["Optimal", "Silent", "Performance"]
        for (index, mode) in fanModes.enumerated() {
            let item = NSMenuItem(title: mode, action: #selector(setFanMode(_:)), keyEquivalent: "")
            item.target = self
            item.tag = index
            item.state = gramSMC.fanMode == index ? .on : .off
            item.isEnabled = isConnected && (gramSMC.capabilities & 0x01 != 0)
            fanMenu.addItem(item)
        }
        let fanItem = NSMenuItem(title: "Fan Mode", action: nil, keyEquivalent: "")
        fanItem.submenu = fanMenu
        fanItem.isEnabled = isConnected && (gramSMC.capabilities & 0x01 != 0)
        menu.addItem(fanItem)
        
        // Battery Care submenu
        let batteryMenu = NSMenu()
        let limits = [80, 100]
        for limit in limits {
            let item = NSMenuItem(title: "\(limit)%", action: #selector(setBatteryCare(_:)), keyEquivalent: "")
            item.target = self
            item.tag = limit
            item.state = gramSMC.batteryCareLimit == limit ? .on : .off
            item.isEnabled = isConnected && (gramSMC.capabilities & 0x02 != 0)
            batteryMenu.addItem(item)
        }
        let batteryItem = NSMenuItem(title: "Battery Care Limit", action: nil, keyEquivalent: "")
        batteryItem.submenu = batteryMenu
        batteryItem.isEnabled = isConnected && (gramSMC.capabilities & 0x02 != 0)
        menu.addItem(batteryItem)
        
        menu.addItem(NSMenuItem.separator())
        
        // Toggle Features - always show, grey out if not available
        addToggleItem(menu, title: "USB Charging", state: gramSMC.usbCharging, 
                     capability: 0x04, action: #selector(toggleUSBCharging), connected: isConnected)
        addToggleItem(menu, title: "Reader Mode", state: gramSMC.readerMode, 
                     capability: 0x08, action: #selector(toggleReaderMode), connected: isConnected)
        addToggleItem(menu, title: "Fn Lock", state: gramSMC.fnLock, 
                     capability: 0x10, action: #selector(toggleFnLock), connected: isConnected)
        addToggleItem(menu, title: "Instant Boot", state: gramSMC.smartOn, 
                     capability: 0x20, action: #selector(toggleSmartOn), connected: isConnected)
        addToggleItem(menu, title: "Boost Mode", state: gramSMC.boostMode, 
                     capability: 0x40, action: #selector(toggleBoostMode), connected: isConnected)
        addToggleItem(menu, title: "Eco Mode", state: gramSMC.ecoMode, 
                     capability: 0x80, action: #selector(toggleEcoMode), connected: isConnected)
        addToggleItem(menu, title: "Webcam", state: gramSMC.webcam, 
                     capability: 0x200, action: #selector(toggleWebcam), connected: isConnected)
        
        menu.addItem(NSMenuItem.separator())
        
        // About
        let aboutItem = NSMenuItem(title: "About GramControlCenter", action: #selector(showAbout), keyEquivalent: "")
        aboutItem.target = self
        menu.addItem(aboutItem)
        menu.addItem(NSMenuItem.separator())
        
        // Quit
        let quitItem = NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        menu.addItem(quitItem)
        
        statusItem.menu = menu
    }
    
    func addToggleItem(_ menu: NSMenu, title: String, state: Bool, capability: UInt32, action: Selector, connected: Bool) {
        let item = NSMenuItem(title: title, action: action, keyEquivalent: "")
        item.target = self
        item.state = state ? .on : .off
        // Enable only if connected AND capability is available
        item.isEnabled = connected && (gramSMC.capabilities & capability != 0)
        menu.addItem(item)
    }
    
    @objc func setFanMode(_ sender: NSMenuItem) {
        gramSMC.setFanMode(UInt32(sender.tag))
        updateMenu()
    }
    
    @objc func setBatteryCare(_ sender: NSMenuItem) {
        gramSMC.setBatteryCareLimit(UInt32(sender.tag))
        updateMenu()
    }
    
    @objc func toggleUSBCharging() {
        gramSMC.setUSBCharging(!gramSMC.usbCharging)
        updateMenu()
    }
    
    @objc func toggleReaderMode() {
        gramSMC.setReaderMode(!gramSMC.readerMode)
        updateMenu()
    }
    
    @objc func toggleFnLock() {
        gramSMC.setFnLock(!gramSMC.fnLock)
        updateMenu()
    }
    
    @objc func toggleSmartOn() {
        gramSMC.setSmartOn(!gramSMC.smartOn)
        updateMenu()
    }
    
    @objc func toggleBoostMode() {
        gramSMC.setBoostMode(!gramSMC.boostMode)
        updateMenu()
    }
    
    @objc func toggleEcoMode() {
        gramSMC.setEcoMode(!gramSMC.ecoMode)
        updateMenu()
    }
    
    @objc func toggleWebcam() {
        gramSMC.setWebcam(!gramSMC.webcam)
        updateMenu()
    }
    
    @objc func showAbout() {
        let alert = NSAlert()
        alert.messageText = "LG Gram Control Center"
        alert.informativeText = """
        Version 1.0
        
        Control your LG Gram laptop features from the menu bar.
        
        Powered by GramSMC kernel extension.
        
        Copyright © 2024-2025 GramSMC contributors.
        Based on LG Control Center for Windows.
        """
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        NSApp.activate(ignoringOtherApps: true)
        alert.runModal()
    }
}

// MARK: - GramSMC IOKit Controller

class GramSMCController {
    var capabilities: UInt32 = 0
    var fanMode: Int = 0
    var batteryCareLimit: Int = 100
    var usbCharging: Bool = false
    var readerMode: Bool = false
    var fnLock: Bool = false
    var smartOn: Bool = false
    var boostMode: Bool = false
    var ecoMode: Bool = false
    var webcam: Bool = true
    var usbTypeC: UInt32 = 0
    var isConnected: Bool = false
    
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
        // Release old service if any
        if service != 0 {
            IOObjectRelease(service)
            service = 0
        }
        
        let matching = IOServiceMatching("GramSMC")
        service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
        
        if service == 0 {
            print("GramSMC service not found - kext may not be loaded")
            isConnected = false
        } else {
            print("GramSMC service found and connected")
            isConnected = true
        }
    }
    
    func refresh() {
        // Try to reconnect if not connected
        if !isConnected {
            connect()
        }
        
        guard service != 0 else { 
            isConnected = false
            // Set default values when not connected
            capabilities = 0
            fanMode = 0
            batteryCareLimit = 100
            usbCharging = false
            readerMode = false
            fnLock = false
            smartOn = false
            boostMode = false
            ecoMode = false
            webcam = true
            usbTypeC = 0
            return 
        }
        
        capabilities = getProperty("Capabilities") ?? 0
        fanMode = Int(getProperty("FanMode") ?? 0)
        batteryCareLimit = Int(getProperty("BatteryCareLimit") ?? 100)
        usbCharging = getBoolProperty("USBCharging")
        readerMode = getBoolProperty("ReaderMode")
        fnLock = getBoolProperty("FnLock")
        smartOn = getBoolProperty("SmartOn")
        boostMode = getBoolProperty("BoostMode")
        ecoMode = getBoolProperty("EcoMode")
        webcam = getBoolProperty("Webcam")
        usbTypeC = getProperty("USBTypeC") ?? 0
        
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
    
    // MARK: - Setters (via IORegistry property setting)
    
    func setFanMode(_ mode: UInt32) {
        guard service != 0 else { 
            print("Cannot set fan mode: GramSMC not connected")
            return 
        }
        fanMode = Int(mode)
        setProperty("FanMode", value: mode)
        print("Setting fan mode to \(mode)")
    }
    
    func setBatteryCareLimit(_ limit: UInt32) {
        guard service != 0 else { 
            print("Cannot set battery care: GramSMC not connected")
            return 
        }
        batteryCareLimit = Int(limit)
        setProperty("BatteryCareLimit", value: limit)
        print("Setting battery care limit to \(limit)%")
    }
    
    func setUSBCharging(_ enabled: Bool) {
        guard service != 0 else { 
            print("Cannot set USB charging: GramSMC not connected")
            return 
        }
        usbCharging = enabled
        setProperty("USBCharging", value: enabled ? 1 : 0)
        print("USB charging: \(enabled)")
    }
    
    func setReaderMode(_ enabled: Bool) {
        guard service != 0 else { return }
        readerMode = enabled
        setProperty("ReaderMode", value: enabled ? 1 : 0)
        print("Reader mode: \(enabled)")
    }
    
    func setFnLock(_ enabled: Bool) {
        guard service != 0 else { return }
        fnLock = enabled
        setProperty("FnLock", value: enabled ? 1 : 0)
        print("Fn lock: \(enabled)")
    }
    
    func setSmartOn(_ enabled: Bool) {
        guard service != 0 else { return }
        smartOn = enabled
        setProperty("SmartOn", value: enabled ? 1 : 0)
        print("SmartOn: \(enabled)")
    }
    
    func setBoostMode(_ enabled: Bool) {
        guard service != 0 else { return }
        boostMode = enabled
        setProperty("BoostMode", value: enabled ? 1 : 0)
        print("Boost mode: \(enabled)")
    }
    
    func setEcoMode(_ enabled: Bool) {
        guard service != 0 else { return }
        ecoMode = enabled
        setProperty("EcoMode", value: enabled ? 1 : 0)
        print("Eco mode: \(enabled)")
    }
    
    func setWebcam(_ enabled: Bool) {
        guard service != 0 else { return }
        webcam = enabled
        setProperty("Webcam", value: enabled ? 1 : 0)
        print("Webcam: \(enabled)")
    }
    
    private func setProperty(_ name: String, value: UInt32) {
        guard service != 0 else { return }
        
        let number = NSNumber(value: value)
        IORegistryEntrySetCFProperty(service, name as CFString, number)
    }
}
