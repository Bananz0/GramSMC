import Foundation
import IOKit

// Replicating GramControlCenterApp.swift logic
func testConnection() {
    print("Starting connection test...")
    
    // Create matching dictionary
    let matching = IOServiceMatching("GramSMC")
    if matching == nil {
        print("Error: IOServiceMatching return NULL")
        return
    }
    
    print("Matching dictionary created.")
    
    // Get service
    // Note: IOServiceGetMatchingService consumes the matching dictionary reference
    let service = IOServiceGetMatchingService(kIOMainPortDefault, matching)
    
    if service == 0 {
        print("Error: GramSMC service not found (service = 0)")
    } else {
        print("Success: GramSMC connected (service = \(service))")
        
        // Try to read a property
        let key = "GramSMC-Version" as CFString
        if let prop = IORegistryEntryCreateCFProperty(service, key, kCFAllocatorDefault, 0) {
            let val = prop.takeRetainedValue()
            print("GramSMC-Version: \(val)")
        } else {
            print("Could not read GramSMC-Version")
        }
        
        IOObjectRelease(service)
    }
}

testConnection()
