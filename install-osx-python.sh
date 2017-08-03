#!/bin/bash
#
# This scripts installs the following:
#  bootstrap
#  prepareOS
#  brew
#  brewCTF
#  osx
#  anaconda

export LIMITLESS_GITPATH="https://github.com/limitlessv/osx-dev-setup.git"

if [ -z ${LIMITLESS_HOME} ];
then
	export LIMITLESS_HOME="$HOME/.LimitlessV"
fi


export TARIKH=`/bin/date +%Y%m%d%H%M%S`
export LIMITLESS_HOME_OLD="$HOME/.LimitlessV.${TARIKH}"
export LIMITLESS_BACKUP="$HOME/.LimitlessV.${TARIKH}/backup"


runme() {
	cmd=$*
	echo "$cmd"
	$cmd
	ret=$?
	if [[ ${ret} != 0 ]]; then
		echo " "
		echo "ERROR: Return value non-zero for: $cmd"
		echo " "
		exit 1
	fi
}

download_repository() {
	if [ -d ${LIMITLESS_HOME} ]; then
	    # Saving current setting
		mv ${LIMITLESS_HOME} ${LIMITLESS_HOME_OLD}
		mkdir -p ${LIMITLESS_HOME}
		echo " "
		echo "Renamed directory ${LIMITLESS_HOME} to ${LIMITLESS_HOME_OLD}"
		echo "You may want to check and delete this directory if not required."
		echo "Old .dotfiles will be saved to ${LIMITLESS_HOME_OLD}"
		echo " "
		sleep ${SLEEP_TIME}
	else
	    # Saving current setting
		echo "Old .dotfiles will be saved to ${LIMITLESS_HOME_OLD}"
	    mkdir -p ${LIMITLESS_HOME_OLD}
	fi

	echo " "
	echo "LIMITLESS GIT Path = ${LIMITLESS_GITPATH}"
	echo " "
	sleep ${SLEEP_TIME}

	runme git clone ${LIMITLESS_GITPATH} ${LIMITLESS_HOME} --recursive
	cd ${LIMITLESS_HOME}
	echo " "
}



make_backup_files() {

    bk_dir_list=(.vim init anaconda1 anaconda3 .pip)
    bk_file_list=(.aliases .bash_profile .bash_prompt .bashrc .curlrc .editorconfig .exports .extra .functions .gitconfig .gitignore .gvimrc .hushlogin .inputrc .path .screenrc .vimrc .wgetrc)

	if [ -d ${LIMITLESS_BACKUP} ]; then
	    echo "Backup will be store in: "$(LIMITLESS_BACKUP)
	else
	    echo 'Create Backup directory: '$LIMITLESS_BACKUP
	    mkdir -p ${LIMITLESS_BACKUP}
	fi


    for i in "${bk_dir_list[@]}"
    do

        if [ -d $HOME/$i ]; then
            echo 'Backup: ['$HOME/$i'] to '$LIMITLESS_BACKUP/$i ;
            cp -frpv $HOME/$i $LIMITLESS_BACKUP/$i;
        else
            echo $HOME/$i' Ignored';
        fi;
    done

    for i in "${bk_file_list[@]}"
    do
        if [ -f $HOME/$i ]; then
            echo 'Backup: ['$HOME/$i'] to '$LIMITLESS_BACKUP/$i ;
            cp -fpv $HOME/$i $LIMITLESS_BACKUP/$i;
        else
            echo $HOME/$i' Ignored';
        fi;
    done


}


function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE" --exclude ".idea/" -avh --no-perms . ~;
    source ~/.bash_profile;
}



echo "+---------------------------------------------------------+"
echo "| Step 01.01: Ask for the administrator password upfront. | "
echo "+---------------------------------------------------------+"

sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "BEGIN: Updating OSX"
sudo softwareupdate -ia --verbose
echo "END: If this requires a restart, run the script again."

# Install only recommended available updates
#sudo softwareupdate -irv


echo "BEGIN: Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install
echo "END: If this requires a restart, run the script again."

echo "BEGIN: If xcode-select: already installed, we are using  \"Software Update.\""
sudo softwareupdate --install -a --verbose
echo "END: If this requires a restart, run the script again."


echo "BEGIN: backup"
make_backup_files
echo $LIMITLESS_HOME
if [ ! -d "$LIMITLESS_HOME" ]; then
    mkdir -p ${LIMITLESS_HOME}
fi
cd $LIMITLESS_HOME
echo "END: backup"

echo "BEGIN: Download repository"
download_repository
echo "END: Download repository"

echo "BEGIN: sync"
cd bootstrap
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
cd ..
echo "END: sync"

echo "BEGIN: brew"
source homebrew/brew.sh
echo "END: brew"



echo "BEGIN: brew-CTF"
source homebrew/brew-CTF.sh
echo "END: brew-CTF"


unset runme;
unset download_repository;
unset make_backup_files;
unset doIt;

