#!/bin/bash

# Script to add GramControlCenter target to Xcode project
# This will create a SwiftUI menu bar application

cd /Users/glenm/GramSMC

# Create the target using xcodebuild by copying the project.pbxproj
# and manually adding the GramControlCenter target configuration

cat << 'EOF' > /tmp/add_target.txt
To add GramControlCenter to Xcode:

1. Open Xcode: 
   open -a Xcode GramSMC.xcodeproj

2. In Xcode:
   - Click the "+" button at the bottom of the targets list
   - Select "App" under "macOS"
   - Product Name: GramControlCenter
   - Team: None
   - Organization Identifier: com.bananz0
   - Bundle Identifier: com.bananz0.GramControlCenter
   - Interface: SwiftUI
   - Language: Swift
   - Click "Finish"

3. Delete the default files created and use existing GramControlCenter folder:
   - In the project navigator, delete the new GramControlCenter group
   - Right-click on project root, select "Add Files to GramSMC"
   - Select the existing GramControlCenter folder
   - Check "Create groups"
   - Select GramControlCenter target
   - Click "Add"

4. Update Build Settings:
   - Select GramControlCenter target
   - Build Settings -> Deployment -> macOS Deployment Target: 11.0
   - Info -> Bundle Identifier: com.bananz0.GramControlCenter
   - Info -> Custom iOS Target Properties -> "Application is agent (UIElement)" = YES

5. Build and Run!
EOF

cat /tmp/add_target.txt

echo ""
echo "Opening Xcode now..."
open -a Xcode GramSMC.xcodeproj

