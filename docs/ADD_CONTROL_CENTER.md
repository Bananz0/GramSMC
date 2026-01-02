# How to Add GramControlCenter to Xcode Project

The GramControlCenter folder was added via git pull but is not yet registered in the Xcode project. Here's how to add it properly:

## Method 1: Add as New Target (Recommended)

1. **Open the project in Xcode:**
   ```bash
   open -a Xcode /Users/glenm/GramSMC/GramSMC.xcodeproj
   ```

2. **Create a new target:**
   - In Xcode, select the project "GramSMC" in the Project Navigator (left sidebar)
   - At the bottom of the targets list, click the **"+"** button
   - Select **"App"** under **macOS** section
   - Click **"Next"**

3. **Configure the target:**
   - **Product Name:** `GramControlCenter`
   - **Team:** None (or your team)
   - **Organization Identifier:** `com.bananz0`
   - **Bundle Identifier:** `com.bananz0.GramControlCenter`
   - **Interface:** SwiftUI
   - **Language:** Swift
   - **Use Core Data:** Unchecked
   - **Include Tests:** Unchecked
   - Click **"Finish"**
   - When asked where to save, choose the project root directory
   - Click **"Create"**

4. **Replace the auto-generated files with existing ones:**
   
   Xcode will create a new `GramControlCenter` folder with default files. We need to replace them:
   
   - In Project Navigator, **delete** the newly created `GramControlCenter` group (right-click → Delete → "Move to Trash")
   
   - Right-click on the project root → **"Add Files to 'GramSMC'..."**
   
   - Navigate to and select the existing `GramControlCenter` folder
   
   - **Important:** Check these options:
     - ✅ "Copy items if needed" (UNCHECKED - we want to reference, not copy)
     - ✅ "Create groups" (SELECTED)
     - ✅ "Add to targets" → Check **GramControlCenter** only
   
   - Click **"Add"**

5. **Configure the target settings:**
   
   Select the **GramControlCenter** target, then:
   
   **General Tab:**
   - **Bundle Identifier:** `com.bananz0.GramControlCenter`
   - **Version:** 1.0
   - **Build:** 1
   - **Minimum Deployments:** macOS 11.0
   
   **Info Tab:**
   - Verify **Info.plist** is set to `GramControlCenter/Info.plist`
   - Under **Custom macOS Application Target Properties**, find or add:
     - **Application is agent (UIElement)** = YES
     - This makes it a menu bar app without dock icon
   
   **Build Settings Tab:**
   - Search for "Info.plist"
   - Set **Info.plist File** to: `GramControlCenter/Info.plist`

6. **Build and test:**
   ```bash
   cd /Users/glenm/GramSMC
   xcodebuild -target GramControlCenter -configuration Release
   ```

---

## Method 2: Quick Command Line (Alternative)

If you're comfortable with the command line, you can use this script:

```bash
cd /Users/glenm/GramSMC

# Open Xcode
open -a Xcode GramSMC.xcodeproj

# Wait for Xcode to fully open, then:
echo "Now in Xcode:"
echo "1. Click '+' button below targets list"
echo "2. Choose 'App' for macOS"
echo "3. Product Name: GramControlCenter"
echo "4. Interface: SwiftUI, Language: Swift"
echo "5. Delete the auto-created GramControlCenter group"
echo "6. Right-click project root → Add Files → Select existing GramControlCenter folder"
echo "7. Make sure 'Create groups' is selected and only GramControlCenter target is checked"
```

---

## Verification

After adding the target, verify it works:

```bash
# List all targets
xcodebuild -list

# You should see:
#   Targets:
#       GramSMC
#       GramSMCDaemon
#       GramControlCenter

# Build the app
xcodebuild -target GramControlCenter -configuration Release

# Run the app
open build/Release/GramControlCenter.app
```

---

## What GramControlCenter Does

GramControlCenter is a **SwiftUI menu bar application** that provides a macOS Control Center-style interface for:

- **Fan Mode Control:** Optimal, Silent, Performance
- **Battery Care Limit:** 80%, 100%
- **USB Charging:** Enable/disable USB power delivery when lid is closed
- **Reader Mode:** Blue light filter
- **Fn Lock:** Toggle Fn key behavior
- **Instant Boot:** Fast wake from sleep
- **Boost Mode:** Performance boost
- **Eco Mode:** Power saving
- **Webcam:** Enable/disable camera

It communicates with the **GramSMC.kext** via IOKit to read and control LG Gram laptop features.

---

## Troubleshooting

### Issue: "GramSMC service not found"
**Solution:** The kext must be loaded via OpenCore for the app to work:
```bash
# Check if kext is loaded
kextstat | grep GramSMC

# If not loaded, ensure it's in OpenCore's config.plist
```

### Issue: "Build failed - No such file or directory: Info.plist"
**Solution:** Verify the Info.plist path in Build Settings:
1. Select GramControlCenter target
2. Build Settings → Packaging
3. Info.plist File = `GramControlCenter/Info.plist`

### Issue: Target appears but files are red/missing
**Solution:** The files weren't added correctly:
1. Delete the GramControlCenter group
2. Re-add using "Add Files to 'GramSMC'..."
3. Make sure "Create groups" is selected
4. Ensure GramControlCenter target is checked

---

## Files in GramControlCenter

```
GramControlCenter/
├── GramControlCenterApp.swift  (311 lines) - Main app with IOKit controller
├── Info.plist                  - Bundle configuration
└── Assets.xcassets/            - App icon and assets
    ├── AppIcon.appiconset/
    └── Contents.json
```

The app is self-contained in a single Swift file with:
- SwiftUI menu bar UI
- IOKit communication with GramSMC.kext
- Property reading and setting
- OSD-style menu interface

---

## Next Steps

Once GramControlCenter is added and building:

1. **Test with the kext loaded:**
   ```bash
   sudo kextstat | grep GramSMC
   open build/Release/GramControlCenter.app
   ```

2. **Install as startup item** (optional):
   - System Settings → General → Login Items
   - Click "+" and add GramControlCenter.app

3. **Package with the release:**
   - The app should be included in the release ZIP alongside the kext and daemon

---

**Note:** This approach is much safer than manually editing project.pbxproj, which can easily corrupt the file due to complex UUIDs and cross-references. Always use Xcode's GUI for adding targets unless you have automated tooling.
