#!/usr/bin/env bash
SETUP_DIR="$(dirname "${BASH_SOURCE}")";
echo $SETUP_DIR/


brew install tesseract
brew install opencv3 --with-python3


ln -s /usr/local/opt/opencv3/lib/python3.5/site-packages/cv2.cpython-35m-darwin.so /usr/local/lib/python3.5/site-packages/

brew tap homebrew/science
brew  install opencv3 --with-contrib
brew tap homebrew/science

cv2_dir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

ln -s /usr/local/opt/opencv3/lib/python3.5/site-packages/cv2.cpython-35m-darwin.so $cv2_dir

ln -s  /usr/local/opt/opencv3/lib/python2.7/site-packages  $cv2_dir