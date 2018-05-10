#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# https://stackoverflow.com/questions/16432071/how-to-fix-homebrew-permissions/16450503#16450503

sudo chgrp -R admin /usr/local
sudo chmod -R g+w /usr/local

sudo chgrp -R admin /Library/Caches/Homebrew
sudo chmod -R g+w /Library/Caches/Homebrew

sudo chgrp -R admin /opt/homebrew-cask
sudo chmod -R g+w /opt/homebrew-cask
