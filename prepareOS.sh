#!/usr/bin/env bash

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.01: Ask for the administrator password upfront.                                                    | "
echo "+------------------------------------------------------------------------------------------------------------+"

sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.02: Updating OSX.  If this requires a restart, run the script again.                               | "
echo "+------------------------------------------------------------------------------------------------------------+"
# Install all available updates
# sudo softwareupdate -iva

sudo softwareupdate -ia --verbose

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.03: Updating OSX.  If this requires a restart, run the script again.                               | "
echo "+------------------------------------------------------------------------------------------------------------+"

# Install only recommended available updates
#sudo softwareupdate -irv


echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.04: Installing Xcode Command Line Tools.                                                           | "
echo "+------------------------------------------------------------------------------------------------------------+"

# Install Xcode command line tools
xcode-select --install

echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.05: If xcode-select: already installed, we are using  "Software Update"                            |"
echo "+------------------------------------------------------------------------------------------------------------+"

sudo softwareupdate --install -a --verbose

