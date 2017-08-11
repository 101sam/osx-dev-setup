#!/usr/bin/env bash
# Configure homebrew permissions to allow multiple users on MAC OSX.
# Any user from the admin group will be able to manage the homebrew and cask installation on the machine.

function runBrewPermissionsFix() {
    # Ask for the administrator password upfront
    sudo -v

    # Allow admins to manage homebrew's local install directory
    echo "Allow admins to manage homebrew's local install directory"
    chgrp -R admin /usr/local
    chmod -R g+w /usr/local

    # Allow admins to homebrew's local cache of formulae and source files
    echo "Allow admins to homebrew's local cache of formulae and source files"
    chgrp -R admin /Library/Caches/Homebrew
    chmod -R g+w /Library/Caches/Homebrew

    # if you are using cask then allow admins to manager cask install too
    echo "Allow admins to manager cask install"
    chgrp -R admin /opt/homebrew-cask
    chmod -R g+w /opt/homebrew-cask
}

echo ""
echo -e "Warrning !!!"
echo -e "This script modify homebrew directory permissions."
echo -e "Allowing multiple users to use brew on MAC OSX without root permission."
read -p "Are you sure? (y/n) " -n 1;

echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    runBrewPermissionsFix $@
fi;


unset runBrewPermissionsFix;

