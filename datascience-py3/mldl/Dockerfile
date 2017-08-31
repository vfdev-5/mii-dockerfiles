FROM datascience-py3-base:latest
MAINTAINER vfdev-mii

LABEL version="0.7"
LABEL description="Machine learning and deep learning python3/GPU setup"

# Install tensorflow, theano, keras, mxnet
RUN pip3 install --no-cache-dir --upgrade \
	tensorflow-gpu==1.2.0 \
	tensorboard \
	theano \
	keras \
	mxnet-cu80 \
	tensor2tensor \
	xgboost

# Install pytorch and torch vision
RUN pip3 --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl

RUN pip --no-cache-dir install --upgrade torchvision

# Install Tensorpack latest
RUN pip3 install --no-cache-dir --upgrade git+git://github.com/ppwwyyxx/tensorpack

# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# TensorBoard
EXPOSE 6006
