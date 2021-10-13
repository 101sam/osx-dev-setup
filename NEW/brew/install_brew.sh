
# ###############################################################################################
# Warning!!!       This script required few times of entering password
#
# ###############################################################################################

#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront. for coreutils
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade 

# Make sure user is owner of homebrew directory
echo "For n to work properly, you need to own homebrew stuff - setting $(whoami) as owner of $(brew --prefix)/*"
sudo chown -R $(whoami) $(brew --prefix)/*

# ###############################################################################################
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# ###############################################################################################
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# ###############################################################################################
# Install Bash 4.
# ###############################################################################################
brew install bash


# ###############################################################################################
# bash-completion2
# Warning!!!       bash-completion2 have refrences in ~/.bash_profile  file
#                  by defaults:
#                              lines 45-68 in .bash_profile are comments out
#                              un comment them based on your needs
# ###############################################################################################
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# ###############################################################################################
# Install font tools.
# ###############################################################################################

echo "Installing webfonts"
{
    brew tap bramstein/webfonttools
    brew install sfnt2woff
    brew install sfnt2woff-zopfli
    brew install woff2
} || {
    echo "One or more brew formulas failed to install"
}

echo "Installing useful libraries"
{
    brew install p7zip
brew install pigz
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc
brew install gcc 
brew install cmake
brew install jq
# necessary for mysql colorized, https://github.com/zpm-zsh/mysql-colorize
brew install gnu-sed 

} || {
    echo "One or more brew formulas failed to install"
}

echo "Installing gpg/gnupg and dependencies"
{
   brew install npth
brew install libtasn1
brew install nettle
brew install libunistring
brew install p11-kit
brew install gnutls
brew install libgpg-error
brew install libgcrypt
brew install libksba
brew install libassuan
brew install pinentry
brew install adns
brew install libusb
brew install gpg
brew install htop
brew install links
brew install watch
brew install --cask \
 qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzip \
    webpquicklook \
    suspicious-package
} || {
    echo "One or more brew formulas failed to install"
}

echo "Installing Brew apps"
{
    brew install --cask --appdir="${HOME}/Applications" \
    android-file-transfer \
    appcleaner \
    caffeine \
    cheatsheet \
    colloquy \
    doubletwist \
    dropbox \
    flux \
    1password \
    rectangle \
    superduper \
    transmission \
    valentina-studio \
    iterm2 \
    tmux \
    ngrok \
    
brew install --cask --appdir="${HOME}/Applications" jetbrains-toolbox
brew install --cask --appdir="${HOME}/Applications" intellij-idea
brew install --cask --appdir="${HOME}/Applications" datagrip
brew install --cask --appdir="${HOME}/Applications" phpstorm
brew install --cask --appdir="${HOME}/Applications" pycharm
brew install --cask --appdir="${HOME}/Applications" webstorm
brew install --cask --appdir="${HOME}/Applications" visual-studio-code
brew install --cask --appdir="${HOME}/Applications" google-chrome
brew install --cask --appdir="${HOME}/Applications" google-backup-and-sync
brew install --cask --appdir="${HOME}/Applications" firefox
brew install --cask --appdir="${HOME}/Applications" whatsapp
brew install --cask --appdir="${HOME}/Applications" slack
brew install --cask --appdir="${HOME}/Applications" adobe-creative-cloud
brew install --cask --appdir="${HOME}/Applications" paintbrush
brew install --cask --appdir="${HOME}/Applications" vlc
brew install --cask --appdir="${HOME}/Applications" github-desktop
brew install --cask --appdir="${HOME}/Applications" notion
brew install --cask --appdir="${HOME}/Applications" brackets
# (if brackets is not in the path (not found) symlink it )
sudo ln -s /Applications/Brackets.app/Contents/Resources/brackets.sh /usr/local/bin/Brackets

brew install --cask --appdir="${HOME}/Applications" bluejeans
brew install --cask --appdir="${HOME}/Applications" docker
brew install --cask --appdir="${HOME}/Applications" postman

brew cleanup
brew tap homebrew/cask
 
} || {
    echo "One or more brew formulas failed to install"
}

