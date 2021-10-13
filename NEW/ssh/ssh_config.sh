
#!/usr/bin/env bash

#  Configure Git
if [ -x "$(command -v brew)" ]; then
    echo "✔️ git installed"
else
    echo "Installing git"
    brew install git
    brew install git-lfs
    brew install git-flow
    brew install git-extras
fi;

echo "Setting global git config with email $git_email and username $git_username"
git config --global --replace-all user.email "$git_email"
git config --global --replace-all user.name "$git_username"

# SSH Key
if [ -f "~/.ssh/id_rsa" ]; then
    echo "SSH Key exists"
else
    echo "Generating an SSH Key - this will be added to your agent for you"
    ssh-keygen -t rsa -b 4096 -C "$git_email"
    echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
    eval "$(ssh-agent -s)"
fi

echo "Copying your SSH key to your clipboard"
pbcopy < ~/.ssh/id_rsa.pub

echo "Add the generated SSH key to your Gitlab account and drive. It has been copied to your clipboard"
echo "Gitlab: https://scm.server.traveljigsaw.com/-/profile/keys"
echo "Drive: https://home.drive.rentalcars.com/profile"
echo "In the Drive APP you have to enter your Active Directory (AD) password."

