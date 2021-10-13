

# Make sure user is owner of homebrew directory
echo "For n to work properly, you need to own homebrew stuff - setting $(whoami) as owner of $(brew --prefix)/*"
sudo chown -R $(whoami) $(brew --prefix)/*

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

# set up vscode
echo "Configure VS Code extensions"
sleep 1
code    --install-extension ms-azuretools.vscode-docker \
        --install-extension marcostazi.VS-code-vagrantfile \
        --install-extension mauve.terraform \
        --install-extension secanis.jenkinsfile-support \
        --install-extension formulahendry.code-runner \
        --install-extension mikestead.dotenv \
        --install-extension oderwat.indent-rainbow \
        --install-extension orta.vscode-jest \
        --install-extension jenkinsxio.vscode-jx-tools \
        --install-extension mathiasfrohlich.kotlin \
        --install-extension christian-kohler.npm-intellisense \
        --install-extension sujan.code-blue \
        --install-extension waderyan.gitblame \
        --install-extension ms-vscode.go \
        --install-extension in4margaret.compareit \
        --install-extension andys8.jest-snippets \
        --install-extension euskadi31.json-pretty-printer \
        --install-extension yatki.vscode-surround \
        --install-extension wmaurer.change-case
