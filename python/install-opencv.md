
install opencv3 on mac for python 3.6:
=========================================
https://stackoverflow.com/questions/43666806/install-opencv3-on-mac-for-python-3-6

Step1:
=======
$ brew edit opencv3

Step2:
=======

Find the following code block and comment all the 4 lines:

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
