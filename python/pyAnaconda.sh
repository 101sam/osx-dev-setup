#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh

# Install in batch mode
bash Anaconda3-4.4.0-MacOSX-x86_64.sh -b

# Install in a batch mode required to add path
export PATH="~/anaconda3/bin:$PATH"

# add path to ~/.path
echo # For anaconda >> ~/.path
echo export PATH='~/anaconda3/bin:$PATH' >> ~/.path

echo "Step 01:"

# Update anaconda root enviroment to the latest
conda update -y --all

# Clean old packages and free memory
conda clean -y --all


echo "Step 02:"

# Install importent packages
conda install -y future

brew install ta-lib
brew install icu4c

echo "Step 03:"


###############################################################################
# We installing the enviroment using conda & pip
# But: We also provide enviroment.yml for creating
###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py36 virtual environment."

conda env create -f conda_py36.yml

echo "Step 04:"


#conda create --name py36 python=3.6
source activate py36

echo "Step 06:"


# For python 3.6
# http://pytorch.org/
pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp36-cp36m-macosx_10_7_x86_64.whl
pip install torchvision

echo "Step 07:"

git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4

cd python-package; python setup.py install
cd ../..

echo "Step 08:"


#
###############################################################################

brew install cmake pkg-config

brew install jpeg libpng libtiff openexr
brew install eigen tbb
brew install gtk+3 boost
#brew cask install xquartz
#brew tap homebrew/science
#brew install opencv3 --with-contrib --with-python3
echo "Step 09:"

conda clean -y --all

###############################################################################
# Python 2.7
###############################################################################
# conda create -n py27 python=2.7
echo "Step 10:"
conda env create -f conda_py27.yml
echo "Step 11:"
source activate py27
echo "Step 12:"

pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp27-none-macosx_10_7_x86_64.whl
pip install torchvision
# OSX Binaries dont support CUDA, install from source if CUDA is needed

echo "Step 13:"

pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp27-none-macosx_10_7_x86_64.whl
pip install torchvision
# OSX Binaries dont support CUDA, install from source if CUDA is needed

echo "Step 14:"

# git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4

cd python-package; python setup.py install
cd ../..
echo "Step 15:"


# Clean up
rm -Rf xgboost
conda clean -y --all

echo "Step 15:"

###############################################################################
# Install IPython Profile
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Default Profile"

# Add the IPython profile
mkdir -p ~/.ipython
cp -r ../init/profile_default/ ~/.ipython/profile_default

echo "Step 16:"

#    If this is your first install of dbus, automatically load on login with:
#        mkdir -p ~/Library/LaunchAgents
#        cp /Users/shmuelm/anaconda3/envs/py36/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
#        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#
#    If this is an upgrade and you already have the org.freedesktop.dbus-session.plist loaded:
#        launchctl unload -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#        cp /Users/shmuelm/anaconda3/envs/py36/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
#        launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

source deactivate
conda clean -y --all

echo "Step 17:"

echo "#"
echo "# To activate python 2.7 environment, use:"
echo "# > source activate py27"
echo "#"
echo "# To activate python 3.6 environment, use:"
echo "# > source activate py36"
echo "#"
echo "# To deactivate an active environment, use:"
echo "# > source deactivate"
echo "#"

