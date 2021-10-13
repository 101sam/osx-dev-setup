#!/usr/bin/env bash



# Make sure user is owner of homebrew directory
echo "For n to work properly, you need to own homebrew stuff - setting $(whoami) as owner of $(brew --prefix)/*"
sudo chown -R $(whoami) $(brew --prefix)/*


echo "Configuring Oh My ZSH"
{ # your 'try' block
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
} || { # your 'catch' block
    echo 'Oh My Zsh like to exit for some reasons so this prevents it'
}

 git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# wrtie line Comment robby russel theme and add powerlevel
# configure theme

# shell restart
# set configuration options auto
p10k configure

# check correct configuration of source  highlighting



# Configure ZSH  plugins
echo "Configuring ZSH plugins"
{
   
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
    
    git clone https://github.com/horosgrisa/mysql-colorize  ~/.oh-my-zsh/custom/plugins/


    sed -i 's/plugins=(git)/plugins=(git
    mysql-colorize
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    node 
    npm 
    bower 
    extract 
    aws 
    bundler
    docker
    docker-compose
    gradle
    helm
    heroku
    history
    kubectl
    man
    mvn
    pip
    pipenv
    pod
    python
    vscode
    yarn
    )/g' ~/.zshrc

} || {
    echo 'Failed to configure zsh plugins'
}





