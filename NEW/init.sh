echo "Hello $(whoami),"
sleep 1
echo "I'm going to configure your computer now."
sleep 1
echo "I'll need a couple of things from you throughout the process"
echo "So I'll get them from you now..."
sleep 2

echo "Gitlab requires a few global settings to be configured"
echo "Enter the email address associated with your Gitlab account: "


# write a loop to check 3 times if the email and user were provided
# if not promt if wants to proceed without setting up.
read -r git_email
export git_email

echo "Enter your full name (Ex. John Doe): "
read -r git_username
export git_username

# Review, not finished
./brew/install_brew.sh

# Review, not finished
./oh-my-zsh/ohmyzsh_setup.sh 

# Copy configFiles folder under user, and apply the configurations
    # iterm config, check how to apply, colors in shell

# Install Java (SDKMAN, JEnv, Java 8, 11, 13, 15, 17)
    # Set java default
# Install Maven 
# Install gradle

# Setup projects locally 
    # create projects directory in documents or desktop
    # clone the projects from gitlab
    # setup each project individually 

# MAC Setup 
    # finder menu view activate options 
        # Show status bar
        #  Show path bar 
        
    # Set theme
        # 

