#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# https://stackoverflow.com/questions/16432071/how-to-fix-homebrew-permissions/16450503#16450503

sudo chgrp -R -L -f -v admin /usr/local
sudo chmod -R  -L -v g+w /usr/local

sudo chgrp -R -L -f -v admin /Library/Caches/Homebrew
sudo chmod -R -L -v g+w /Library/Caches/Homebrew

sudo chgrp -R -L -f -v admin /opt/homebrew-cask
sudo chmod -R -L -v g+w /opt/homebrew-cask
