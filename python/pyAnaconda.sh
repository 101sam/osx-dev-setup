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
brew install cmake pkg-config
brew install jpeg libpng libtiff openexr
brew install eigen tbb
brew install gtk+3 boost
brew install graphviz

brew tap homebrew/science
brew install openblas
brew install opencv



echo "Step 03:"

###############################################################################
# Python 2.7
###############################################################################
# conda create -n py27 python=2.7
echo "Step 04:"
conda env create -f conda_py27.yml
echo "Step 05:"
source activate py27
echo "Step 06:"

pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp27-none-macosx_10_7_x86_64.whl
pip install torchvision
# OSX Binaries dont support CUDA, install from source if CUDA is needed

echo "Step 07:"

pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp27-none-macosx_10_7_x86_64.whl
pip install torchvision
# OSX Binaries dont support CUDA, install from source if CUDA is needed

echo "Step 08:"

git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4

cd python-package; python setup.py install
cd ../..
echo "Step 09:"

pip install polyglot

# Clean up
rm -Rf xgboost
conda clean -y --all

echo "Step 10:"
###############################################################################
# We installing the enviroment using conda & pip
# But: We also provide enviroment.yml for creating
###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py36 virtual environment."
conda env create -f conda_py36.yml

echo "Step 11:"
#conda create --name py36 python=3.6
source activate py36

echo "Step 12:"
# For python 3.6
# http://pytorch.org/
pip install http://download.pytorch.org/whl/torch-0.1.12.post2-cp36-cp36m-macosx_10_7_x86_64.whl
pip install torchvision

echo "Step 13:"
# git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4

cd python-package; python setup.py install
cd ../..

echo "Step 14:"
# Re insurance due the depandacy orders some of those package my need to re-install
pip install tensorflow
pip install polyglot
pip install tqdm
pip install nltk
pip install theano
pip install keras
pip install lightgbm
pip install opencv-python
###############################################################################
echo "Step 15:"
conda clean -y --all

###############################################################################
# Install IPython Profile
###############################################################################
echo "------------------------------"
echo "Installing IPython Notebook Default Profile"

# Add the IPython profile
mkdir -p ~/.ipython
cp -r ../init/profile_default/ ~/.ipython/profile_default

echo "Step 16:"

source deactivate
conda clean -y --all
cd ..

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

