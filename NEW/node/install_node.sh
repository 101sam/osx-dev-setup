

# Make sure user is owner of homebrew directory
echo "For n to work properly, you need to own homebrew stuff - setting $(whoami) as owner of $(brew --prefix)/*"
sudo chown -R $(whoami) $(brew --prefix)/*

# ###############################################################################################
# install nodejs
# ###############################################################################################
# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# N
if [ -x "$(command -v n)" ]; then
    echo "N - Node version manager installed with latest LTS of Node"
else
    npm install -g n
    sudo mkdir -p /usr/local/n
    sudo mkdir -p /usr/local/bin
    sudo mkdir -p /usr/local/share
    sudo mkdir -p /usr/local/lib
    sudo mkdir -p /usr/local/include

    # take ownership of node install destination folders
    sudo chown -R $(whoami) /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
    # Use the latest version of Node
    echo "Using latest version of Node"
    n latest
fi;

if [ -x "$(command -v aws)" ]; then
    echo "aws cli installed"
else
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
fi;

if [ -x "$(command -v sam)" ]; then
    echo "Sam cli installed"
else
    brew tap aws/tap
    brew install aws-sam-cli
fi;

if [code -x "$(command -v code)" ]; then
    echo "VSCode installed"
else
    brew cask install visual-studio-code
# set up vscode
    echo "Configure VS Code extensions"
    sleep 1
    code --install-extension akamud.vscode-theme-onedark
    code --install-extension alefragnani.project-manager
    code --install-extension amazonwebservices.aws-toolkit-vscode
    code --install-extension antfu.browse-lite
    code --install-extension antfu.vite
    code --install-extension aws-scripting-guy.cform
    code --install-extension batisteo.vscode-django
    code --install-extension burkeholland.simple-react-snippets
    code --install-extension chris-noring.node-snippets
    code --install-extension christian-kohler.npm-intellisense
    code --install-extension christian-kohler.path-intellisense
    code --install-extension codezombiech.gitignore
    code --install-extension cweijan.vscode-office
    code --install-extension DavidAnson.vscode-markdownlint
    code --install-extension dbaeumer.jshint
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension donjayamanne.git-extension-pack
    code --install-extension donjayamanne.githistory
    code --install-extension donjayamanne.python-environment-manager
    code --install-extension donjayamanne.python-extension-pack
    code --install-extension dotdevru.prettier-java
    code --install-extension dsznajder.es7-react-js-snippets
    code --install-extension dzannotti.vscode-babel-coloring
    code --install-extension eamodio.gitlens
    code --install-extension EditorConfig.EditorConfig
    code --install-extension eg2.vscode-npm-script
    code --install-extension emmanuelbeziat.vscode-great-icons
    code --install-extension equinusocio.vsc-material-theme-icons
    code --install-extension esbenp.prettier-vscode
    code --install-extension formulahendry.auto-complete-tag
    code --install-extension formulahendry.auto-rename-tag
    code --install-extension formulahendry.code-runner
    code --install-extension fwcd.kotlin
    code --install-extension GabrielBB.vscode-lombok
    code --install-extension georgewfraser.vscode-javac
    code --install-extension GitHub.copilot
    code --install-extension GregorBiswanger.json2ts
    code --install-extension Gruntfuggly.todo-tree
    code --install-extension hollowtree.vue-snippets
    code --install-extension HookyQR.beautify
    code --install-extension humao.rest-client
    code --install-extension idleberg.openvpn
    code --install-extension infeng.vscode-react-typescript
    code --install-extension ionutvmi.path-autocomplete
    code --install-extension janisdd.vscode-edit-csv
    code --install-extension jasonnutter.search-node-modules
    code --install-extension JustBrenny.hero-heroku
    code --install-extension kenhowardpdx.vscode-gist
    code --install-extension KevinRose.vsc-python-indent
    code --install-extension kisstkondoros.vscode-codemetrics
    code --install-extension leizongmin.node-module-intellisense
    code --install-extension loganarnett.lambda-snippets
    code --install-extension loiane.ts-extension-pack
    code --install-extension mathiasfrohlich.Kotlin
    code --install-extension mechatroner.rainbow-csv
    code --install-extension meganrogge.template-string-converter
    code --install-extension mgmcdermott.vscode-language-babel
    code --install-extension mikestead.dotenv
    code --install-extension miramac.vscode-exec-node
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension ms-edgedevtools.vscode-edge-devtools
    code --install-extension ms-python.python
    code --install-extension ms-toolsai.jupyter-keymap
    code --install-extension ms-vscode-remote.remote-containers
    code --install-extension ms-vscode-remote.remote-ssh
    code --install-extension ms-vscode-remote.remote-wsl
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack
    code --install-extension ms-vscode.js-debug-nightly
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode.vscode-typescript-next
    code --install-extension ms-vscode.vscode-typescript-tslint-plugin
    code --install-extension msjsdiag.vscode-react-native
    code --install-extension mubaidr.vuejs-extension-pack
    code --install-extension naco-siren.gradle-language
    code --install-extension njpwerner.autodocstring
    code --install-extension octref.vetur
    code --install-extension Orta.vscode-jest
    code --install-extension Pivotal.vscode-boot-dev-pack
    code --install-extension Pivotal.vscode-spring-boot
    code --install-extension PKief.material-icon-theme
    code --install-extension pkosta2005.heroku-command
    code --install-extension pmneo.tsimporter
    code --install-extension rbbit.typescript-hero
    code --install-extension redhat.fabric8-analytics
    code --install-extension redhat.java
    code --install-extension redhat.vscode-apache-camel
    code --install-extension redhat.vscode-commons
    code --install-extension redhat.vscode-xml
    code --install-extension redhat.vscode-yaml
    code --install-extension ritwickdey.LiveServer
    code --install-extension sdras.vue-vscode-snippets
    code --install-extension Shan.code-settings-sync
    code --install-extension shd101wyy.markdown-preview-enhanced
    code --install-extension sketchbuch.vsc-quokka-statusbar
    code --install-extension sohibe.java-generate-setters-getters
    code --install-extension SonarSource.sonarlint-vscode
    code --install-extension streetsidesoftware.code-spell-checker
    code --install-extension stringham.move-ts
    code --install-extension techer.open-in-browser
    code --install-extension tombonnike.vscode-status-bar-format-toggle
    code --install-extension VisualStudioExptTeam.vscodeintellicode
    code --install-extension vscjava.vscode-gradle
    code --install-extension vscjava.vscode-java-debug
    code --install-extension vscjava.vscode-java-dependency
    code --install-extension vscjava.vscode-java-pack
    code --install-extension vscjava.vscode-java-test
    code --install-extension vscjava.vscode-maven
    code --install-extension vscjava.vscode-spring-boot-dashboard
    code --install-extension vscjava.vscode-spring-initializr
    code --install-extension vscode-icons-team.vscode-icons
    code --install-extension Vue.volar
    code --install-extension Vue.vscode-typescript-vue-plugin
    code --install-extension waderyan.nodejs-extension-pack
    code --install-extension WallabyJs.quokka-vscode
    code --install-extension wholroyd.jinja
    code --install-extension xabikos.JavaScriptSnippets
    code --install-extension yzane.markdown-pdf
    code --install-extension yzhang.markdown-all-in-one
    code --install-extension Zignd.html-css-class-completion
    code --install-extension ZixuanChen.vitest-explorer
    code --install-extension ziyasal.vscode-open-in-github

fi;