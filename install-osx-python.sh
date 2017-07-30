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
	export LIMITLESS_HOME="$HOME/LIMITLESS"
fi

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
		mv ${LIMITLESS_HOME} ${LIMITLESS_HOME.old}
		echo " "
		echo "Renamed directory ${LIMITLESS_HOME} to ${LIMITLESS_HOME.old}"
		echo "You may want to check and delete this directory if not required."
		echo " "
		sleep ${SLEEP_TIME}
	fi

	echo " "
	echo "LIMITLESS GIT Path = ${LIMITLESS_GITPATH}"
	echo " "
	sleep ${SLEEP_TIME}

	runme git clone ${LIMITLESS_GITPATH} ${LIMITLESS_HOME} --recursive
	cd ${LIMITLESS_HOME}
	echo " "

}


echo "+------------------------------------------------------------------------------------------------------------+"
echo "| Step 01.01: Ask for the administrator password upfront.                                                    | "
echo "+------------------------------------------------------------------------------------------------------------+"

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

echo "BEGIN: If xcode-select: already installed, we are using  "Software Update."
sudo softwareupdate --install -a --verbose
echo "END: If this requires a restart, run the script again."


echo "BEGIN: Download repository"
download_repository
echo "END: Download repository"