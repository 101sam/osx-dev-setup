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

#brew install boost-python --with-python3

###############################################################################
# Python 2 Virtual Enviroment
# conda env export --name root | grep -v "^prefix: " > environment.yml
# http://tdhopper.com/blog/2015/Nov/24/my-python-environment-workflow-with-conda/
# https://stackoverflow.com/questions/41274007/anaconda-export-environment-file
###############################################################################

echo "------------------------------"
echo "Setting up py27 virtual environment."
conda env create --name py27 python=2.7 -f environment.yml

source activate py27


###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py36 virtual environment."


conda create --name py36 python=3.6
source activate py36



'''
python-linkedin
http://thinktostart.com/download-your-linkedin-contacts-with-python/

'''

