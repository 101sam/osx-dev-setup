###Additional configuration Open Terminal and execute the following commands :

    To have launchd start mysql at login :
    ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
    To load mysql immediately :
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    Finally add the mysql directory to your PATH environment variable in .bash_profile :

export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
export PATH=$PATH:$MYSQL_PATH/bin



brew services start mysql
mysql -uroot -p

