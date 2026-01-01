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
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "laptopcomputer", accessibilityDescription: "LG Control Center")
            button.image?.isTemplate = true
        }
        
        // Initialize GramSMC controller
        gramSMC = GramSMCController()
        
        // Build menu
        updateMenu()
        
        // Refresh periodically
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.gramSMC.refresh()
            self?.updateMenu()
        }
    }
    
    func updateMenu() {
        let menu = NSMenu()
        
        // Header
        let headerItem = NSMenuItem(title: "LG Control Center", action: nil, keyEquivalent: "")
        headerItem.isEnabled = false
        menu.addItem(headerItem)
        menu.addItem(NSMenuItem.separator())
        
        // Fan Mode submenu
        if gramSMC.capabilities & 0x01 != 0 {
            let fanMenu = NSMenu()
            let fanModes = ["Optimal", "Silent", "Performance"]
            for (index, mode) in fanModes.enumerated() {
                let item = NSMenuItem(title: mode, action: #selector(setFanMode(_:)), keyEquivalent: "")
                item.target = self
                item.tag = index
                item.state = gramSMC.fanMode == index ? .on : .off
                fanMenu.addItem(item)
            }
            let fanItem = NSMenuItem(title: "Fan Mode", action: nil, keyEquivalent: "")
            fanItem.submenu = fanMenu
            menu.addItem(fanItem)
        }
        
        // Battery Care
        if gramSMC.capabilities & 0x02 != 0 {
            let batteryMenu = NSMenu()
            let limits = [80, 100]
            for limit in limits {
                let item = NSMenuItem(title: "\(limit)%", action: #selector(setBatteryCare(_:)), keyEquivalent: "")
                item.target = self
                item.tag = limit
                item.state = gramSMC.batteryCareLimit == limit ? .on : .off
                batteryMenu.addItem(item)
            }
            let batteryItem = NSMenuItem(title: "Battery Care Limit", action: nil, keyEquivalent: "")
            batteryItem.submenu = batteryMenu
            menu.addItem(batteryItem)
        }
        
        menu.addItem(NSMenuItem.separator())
        
        // Toggle Features (only supported by this DSDT)
        addToggleItem(menu, title: "USB Charging", state: gramSMC.usbCharging, 
                     capability: 0x04, action: #selector(toggleUSBCharging))
        addToggleItem(menu, title: "Reader Mode", state: gramSMC.readerMode, 
                     capability: 0x08, action: #selector(toggleReaderMode))
        addToggleItem(menu, title: "Fn Lock", state: gramSMC.fnLock, 
                     capability: 0x10, action: #selector(toggleFnLock))
        addToggleItem(menu, title: "Webcam", state: gramSMC.webcam, 
                     capability: 0x200, action: #selector(toggleWebcam))
        
        menu.addItem(NSMenuItem.separator())
        
        // About
        menu.addItem(NSMenuItem(title: "About GramControlCenter", action: #selector(showAbout), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        
        // Quit
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    func addToggleItem(_ menu: NSMenu, title: String, state: Bool, capability: UInt32, action: Selector) {
        if gramSMC.capabilities & capability != 0 {
            let item = NSMenuItem(title: title, action: action, keyEquivalent: "")
            item.target = self
            item.state = state ? .on : .off
            menu.addItem(item)
        }
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
    
    @objc func toggleWebcam() {
        gramSMC.setWebcam(!gramSMC.webcam)
        updateMenu()
    }
    
    @objc func showAbout() {
        let alert = NSAlert()
        alert.messageText = "GramControlCenter"
        alert.informativeText = "LG Gram Control Center for macOS\n\nVersion 1.0\n\nFeatures: Fan Mode, Battery Care, USB Charging,\nReader Mode, Fn Lock, Webcam Toggle\n\nPowered by GramSMC"
        alert.alertStyle = .informational
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}

// MARK: - GramSMC IOKit Controller

class GramSMCController {
    var capabilities: UInt32 = 0
    var fanMode: UInt32 = 0
    var batteryCareLimit: UInt32 = 100
    var usbCharging: Bool = false
    var readerMode: Bool = false
    var fnLock: Bool = false
    var webcam: Bool = true
    
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
        let matching = IOServiceMatching("GramSMC")
        service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
        
        if service == 0 {
            print("GramSMC service not found")
        }
    }
    
    func refresh() {
        guard service != 0 else { return }
        
        capabilities = getProperty("Capabilities") ?? 0
        fanMode = getProperty("FanMode") ?? 0
        batteryCareLimit = getProperty("BatteryCareLimit") ?? 100
        usbCharging = getBoolProperty("USBCharging")
        readerMode = getBoolProperty("ReaderMode")
        fnLock = getBoolProperty("FnLock")
        webcam = getBoolProperty("Webcam")
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
    
    // MARK: - Setters (via ACPI evaluation - requires kernel extension support)
    // Note: These methods require the kext to expose setProperty functionality
    // For now, they update local state - actual implementation needs kext modification
    
    func setFanMode(_ mode: UInt32) {
        fanMode = mode
        // TODO: Call kext to set fan mode
        print("Setting fan mode to \(mode)")
    }
    
    func setBatteryCareLimit(_ limit: UInt32) {
        batteryCareLimit = limit
        print("Setting battery care limit to \(limit)%")
    }
    
    func setUSBCharging(_ enabled: Bool) {
        usbCharging = enabled
        print("USB charging: \(enabled)")
    }
    
    func setReaderMode(_ enabled: Bool) {
        readerMode = enabled
        print("Reader mode: \(enabled)")
    }
    
    func setFnLock(_ enabled: Bool) {
        fnLock = enabled
        print("Fn lock: \(enabled)")
    }
    
    func setWebcam(_ enabled: Bool) {
        webcam = enabled
        print("Webcam: \(enabled)")
    }
}
