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
sudo launchctl unload /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null
sudo pkill -f GramSMCDaemon

# install new GramSMCDaemon
sudo mkdir -p /usr/local/bin/
sudo chmod -R 755 /usr/local/bin/
sudo cp $DIR/GramSMCDaemon /usr/local/bin/
sudo chmod 755 /usr/local/bin/GramSMCDaemon
sudo chown root:wheel /usr/local/bin/GramSMCDaemon
sudo xattr -d com.apple.quarantine /usr/local/bin/GramSMCDaemon 2>/dev/null

sudo cp $DIR/com.gramsmc.GramSMCDaemon.plist /Library/LaunchAgents
sudo chmod 644 /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo chown root:wheel /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo xattr -d com.apple.quarantine /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null

sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
