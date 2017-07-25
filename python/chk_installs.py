#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: Shmuel Maruani
"""
from __future__ import print_function, unicode_literals
from __future__ import absolute_import, division
import platform

import importlib
import warnings


def fxn():
    warnings.warn("deprecated", DeprecationWarning)


# from importlib.util import warnings
# warnings.showwarning=False

'''
Note:
    mxnet & statsmodels should be before any other deep learning
                        modules as the may cause crash during loading
'''

packages = [
            'scipy',
            'numpy',
            'matplotlib',
            'pandas',
            'sklearn',
            'sphinx',
            'future',
            'tqdm',
            'nltk',
            'mxnet',
            'statsmodels',
            'tensorflow',
            'theano',
            'torch',
            'keras',
            'xgboost',
            'lightgbm',
            'cntk',
            'dlib',
            'polyglot',
            'seaborn',
            'cv2',
            'face_recognition']



def chk_if_installed(verbose=0):
    installed_modules = {}
    for pkg in packages:
        try:
            if verbose==1:
                print('Checking package: %s' % pkg)
            module = importlib.import_module(pkg, __name__) #package=None)
            installed_modules[pkg]= module.__version__
            #del sys.modules[pkg]
            #gc.collect()
        except Exception as e:
            installed_modules[pkg] = 'No installed'
            if verbose==1:
                print('Error while process package: %s' % pkg)
                print('Error: %s' % e)

    for mod in installed_modules:
        print('%s....: %s' %(mod, installed_modules[mod]))


if __name__ == "__main__":
    print("Python version:",platform.python_version())
    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        warnings.filterwarnings("ignore")
        chk_if_installed(verbose=0)






