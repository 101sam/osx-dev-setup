# ###############################################################################################
#
# ###############################################################################################

#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ###############################################################################################
# Check for Homebrew,
# Install if we don't have it
# ###############################################################################################

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all