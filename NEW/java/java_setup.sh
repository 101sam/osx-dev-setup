
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 17.0.0-zulu
sdk install java 16.0.2-zulu
sdk install java 11.0.12-zulu
sdk install java 8.0.302-zulu

# java 13 installation
# download from link 
https://cdn.azul.com/zulu/bin/zulu13.42.17-ca-jdk13.0.8-macosx_x64.zip

# unzip to folder "$HOME/.sdkman/candidates/java/
# rename to 13.0.x-zulu
# install manually with sdkman 
# check if there are any versions to install only locally
    # get available versions from zulu
    curl -X 'GET' \
  'https://api.azul.com/zulu/download/community/v1.0/bundles/?java_version=13.0&jdk_version=13.0&os=macos&arch=x86&hw_bitness=64' \
  -H 'accept: application/json'
    # download version 
    # api zulu https://app.swaggerhub.com/apis-docs/azul/zulu-download-community/1.0#/bundles/get_bundles_
    # site https://www.azul.com/downloads/?version=java-13-mts&os=macos&package=jdk&show-old-builds=true
    # install version with sdkman       
sdk install java 13-zulu "$HOME/.sdkman/candidates/java/{get name of the file}/{name of the forlder with the jdk}/Contents/Home

"$HOME/.sdkman/candidates/java/



# brew install jenv
# echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(jenv init -)"' >> ~/.zshrc

# jenv add /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# jenv add /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# jenv add /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# setup dev directory


echo "Creating development directory at ~/Documents/dev"
mkdir -p ~/Documents/dev