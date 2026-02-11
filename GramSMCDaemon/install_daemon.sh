#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# remove old AsusSMC daemons
sudo launchctl unload /Library/LaunchAgents/com.hieplpvip.AsusFnKeysDaemon.plist 2>/dev/null
sudo pkill -f AsusFnKeysDaemon
sudo rm /usr/bin/AsusFnKeysDaemon 2>/dev/null
sudo rm /Library/LaunchAgents/com.hieplpvip.AsusFnKeysDaemon.plist 2>/dev/null

sudo launchctl unload /Library/LaunchAgents/com.hieplpvip.AsusSMCDaemon.plist 2>/dev/null
sudo pkill -f AsusSMCDaemon
sudo rm /usr/bin/AsusSMCDaemon 2>/dev/null
sudo rm /usr/local/bin/AsusSMCDaemon 2>/dev/null
sudo rm /Library/LaunchAgents/com.hieplpvip.AsusSMCDaemon.plist 2>/dev/null

# remove old GramSMCDaemon
CURRENT_USER=$(stat -f '%u' /dev/console)
if [ "$CURRENT_USER" -ne 0 ]; then
    sudo -u "#$CURRENT_USER" launchctl bootout "gui/$CURRENT_USER" /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist 2>/dev/null || true
fi
sudo launchctl unload /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist 2>/dev/null || true
sudo rm /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist 2>/dev/null
sudo pkill -f GramSMCDaemon

# install new GramSMCDaemon
sudo mkdir -p /usr/local/bin/
sudo cp "$DIR/GramSMCDaemon" /usr/local/bin/
sudo chmod 755 /usr/local/bin/GramSMCDaemon
sudo chown root:wheel /usr/local/bin/GramSMCDaemon
sudo xattr -d com.apple.quarantine /usr/local/bin/GramSMCDaemon 2>/dev/null

# We use LaunchAgents so it runs in the user's GUI session for OSD support
sudo cp "$DIR/com.bananz0.GramSMCDaemon.plist" /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist
sudo chown root:wheel /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist
sudo xattr -d com.apple.quarantine /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist 2>/dev/null

# Load for the current user
if [ "$CURRENT_USER" -ne 0 ]; then
    echo "Loading GramSMCDaemon for user $CURRENT_USER..."
    sudo -u "#$CURRENT_USER" launchctl bootstrap "gui/$CURRENT_USER" /Library/LaunchAgents/com.bananz0.GramSMCDaemon.plist 2>/dev/null || true
else
    echo "No logged in user found to load agent. It will load on next login."
fi

# Try to handle the App too if we are in a collection folder
if [ -d "$DIR/GramControlCenter.app" ]; then
    echo "Installing GramControlCenter.app..."
    sudo rm -rf /Applications/GramControlCenter.app
    sudo cp -R "$DIR/GramControlCenter.app" /Applications/
    if [ -f "$DIR/com.bananz0.GramControlCenter.plist" ]; then
        sudo cp "$DIR/com.bananz0.GramControlCenter.plist" /Library/LaunchAgents/
        sudo chown root:wheel /Library/LaunchAgents/com.bananz0.GramControlCenter.plist
        if [ "$CURRENT_USER" -ne 0 ]; then
            sudo -u "#$CURRENT_USER" launchctl bootstrap "gui/$CURRENT_USER" /Library/LaunchAgents/com.bananz0.GramControlCenter.plist 2>/dev/null || true
        fi
    fi
    if [ "$CURRENT_USER" -ne 0 ]; then
        sudo -u "#$CURRENT_USER" open /Applications/GramControlCenter.app
    fi
fi
