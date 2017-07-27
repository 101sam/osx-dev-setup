#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh

# Install in batch mode
bash Anaconda3-4.4.0-MacOSX-x86_64.sh -b

# Install in a batch mode required to add path
export PATH="~/anaconda3/bin:$PATH"

# add path to ~/.path
echo # For anaconda >> ~/.path
echo export PATH='~/anaconda3/bin:$PATH' >> ~/.path


# Update anaconda root enviroment to the latest
conda update -y --all

# Clean old packages and free memory
conda clean -y --all

# Install importent packages
conda install -y future

brew install ta-lib

###############################################################################
# We installing the enviroment using conda & pip
# But: We also provide enviroment.yml for creating
###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py36 virtual environment."

conda env create -f conda_py36.yml

#conda create --name py36 python=3.6
source activate py36

# For python 3.6
# http://pytorch.org/
pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp36-cp36m-macosx_10_7_x86_64.whl
pip install torchvision

git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4

cd python-package; python setup.py install
cd ../..


#
###############################################################################

brew install cmake pkg-config
brew install jpeg libpng libtiff openexr
brew install eigen tbb
brew install gtk+3 boost
#brew cask install xquartz

#brew tap homebrew/science
#brew install opencv3 --with-contrib --with-python3

###############################################################################


###############################################################################
# Install IPython Profile
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Default Profile"

# Add the IPython profile
mkdir -p ~/.ipython
cp -r ../init/profile_default/ ~/.ipython/profile_default


#    If this is your first install of dbus, automatically load on login with:
#        mkdir -p ~/Library/LaunchAgents
#        cp /Users/shmuelm/anaconda3/envs/py36/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
#        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#
#    If this is an upgrade and you already have the org.freedesktop.dbus-session.plist loaded:
#        launchctl unload -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#        cp /Users/shmuelm/anaconda3/envs/py36/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
#        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

conda clean -y --all