# If you installed without update ruby to newer version

# https://github.com/sparklemotion/nokogiri/issues/1483
brew uninstall --ignore-dependencies libxslt
brew uninstall --ignore-dependencies libxml2
brew uninstall --ignore-dependencies xz
brew doctor
brew install libxslt
brew install libxml2
brew install xz
brew doctor
brew install ruby
brew doctor


brew cleanup
