# ###############################################################################################
# Warning!!!       Run it only if you going to use Ruby
# ###############################################################################################

#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

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

# ###############################################################################################
# Install ruby-build and rbenv
# ###############################################################################################

brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# ###############################################################################################
# Install php
# Common upgrade issues: https://github.com/Homebrew/homebrew-php
# ###############################################################################################

#brew install homebrew/php/php55 --with-gmp
#brew install homebrew/homebrew-php --with-gmp