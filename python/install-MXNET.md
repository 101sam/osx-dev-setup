# http://mxnet.io/get_started/install.html
# Warning:
#         before installing mxnet note that most of the version may have some problems

# http://mxnet.io/get_started/osx_setup.html



git clone --recursive https://github.com/dmlc/mxnet ~/mxnet
cd ~/mxnet
cp make/osx.mk ./config.mk
echo "USE_BLAS = openblas" >> ./config.mk
echo "ADD_CFLAGS += -I/usr/local/opt/openblas/include" >> ./config.mk
echo "ADD_LDFLAGS += -L/usr/local/opt/openblas/lib" >> ./config.mk
echo "ADD_LDFLAGS += -L/usr/local/lib/graphviz/" >> ./config.mk
make -j$(sysctl -n hw.ncpu)

cd python
python setup.py install

