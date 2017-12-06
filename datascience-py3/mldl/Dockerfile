FROM datascience-py3-base:cuda9_cudnn7
MAINTAINER vfdev-mii

LABEL version="0.1"
LABEL description="Machine learning and deep learning python3/GPU setup"


# Install tensorflow, theano, keras, mxnet
RUN pip3 install --no-cache-dir --upgrade \
	tensorflow-gpu \
	tensorboard \
	theano \
	keras \
	mxnet-cu80 \
	tensor2tensor \
	xgboost \ 
	visdom


# Install pytorch and torch vision
RUN pip3 --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu90/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl 	


RUN pip3 --no-cache-dir install --upgrade torchvision


# Install Tensorpack latest
RUN pip3 install --no-cache-dir --upgrade git+git://github.com/ppwwyyxx/tensorpack


# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH


# TensorBoard
EXPOSE 6006


# Visdom
EXPOSE 8097
