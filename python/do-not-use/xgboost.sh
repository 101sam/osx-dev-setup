cd ~/projects/
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/minimum.mk ./config.mk; make -j4
cd python-package
python setup.py install