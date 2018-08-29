## Step 1 - Create a Personal Access Token for Homebrew

    Login to your Github Account or create one if you don't have one yet.
    
    In the top menu to the right, click the tools icon (Settings).
    Click on “Developer settings” in the sidebar (to the left).
    In the box with the title “Personal Access Tokens”, press the “Create new token” button.
    [Personal Access Tokens](https://github.com/settings/tokens)

    When done, you will see your token we just created in the “Personal Access Tokens” box. Copy the Token by select the token or click the copy icon to the right of the Token text.
    The Token text should look something like this: bad562a12420ba1b1c1d1e15cfe3957b93b464ac (not a real token, just an example)

IMPORTANT! Remember To Keep The Token Safe As It Works As A “Password” For Your Github Account.

## Step 2 - Set the Github API Token for Homebrew in the Terminal
echo "export HOMEBREW_GITHUB_API_TOKEN=bad562a12420ba1b1c1d1e15cfe3957b93b464ac" >> ~/.exports
