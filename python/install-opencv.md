Try to install opencv

$ source activate py36
$ brew tap homebrew/science
$ brew install opencv3 --with-contrib --with-python3


in case:
Error: opencv3: Does not support building both Python 2 and 3 wrappers


If fail to install follow this steps:
=======================================



install opencv3 on mac for python 3.6:
=========================================
https://stackoverflow.com/questions/43666806/install-opencv3-on-mac-for-python-3-6

Step1:
=======
$ brew tap homebrew/science
$ brew edit opencv3

Step2:
=======

Find the following code block and comment all the 4 lines (aroud line 206):

if build.with?("python3") && build.with?("python")
  # Opencv3 Does not support building both Python 2 and 3 versions
  odie "opencv3: Does not support building both Python 2 and 3 wrappers"
end

Finally install using the brew install command:
Step3:
=======

$ brew install opencv3 --with-contrib --with-python3

Step3:
=======

$ SITE_PACK_DIR=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")


cp /usr/local/opt/opencv3/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so $SITE_PACK_DIR



Ref:
Assume version is: 3.6
Copy the cv2.cpython-36m-darwin.so to  ~/anaconda/lib/python3.6/site-packages/.
cp /usr/local/opt/opencv3/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so ~/anaconda/lib/python3.6/site-packages/.

Reference: http://www.pyimagesearch.com/2017/05/15/resolving-macos-opencv-homebrew-install-errors/



This formula is keg-only, which means it was not symlinked into /usr/local,
because opencv3 and opencv install many of the same files.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/opencv3/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/opencv3/lib
    CPPFLAGS: -I/usr/local/opt/opencv3/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/opencv3/lib/pkgconfig


If you need Python to find bindings for this keg-only formula, run:
  echo /usr/local/opt/opencv3/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/opencv3.pth
  mkdir -p /Users/shmuelm/.local/lib/python3.6/site-packages
  echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' >> /Users/shmuelm/.local/lib/python3.6/site-packages/homebrew.pth
==> Summary

