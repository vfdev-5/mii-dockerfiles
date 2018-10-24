FROM datascience-py2-base:latest
MAINTAINER vfdev-mii

LABEL version="0.3"
LABEL description="Machine learning and deep learning python2/GPU setup"


# Install tensorflow, pytorch, keras, mxnet
RUN pip install --no-cache-dir --upgrade \
	tensorflow-gpu \
	tensorboard \
	keras \
	git+https://github.com/hyperopt/hyperopt

# Inconsistent dependency on numpy==1.13.3 as others depend on 1.14.0
# RUN pip install --no-cache-dir --upgrade \
# 	https://pypi.python.org/packages/2d/b6/df25199a39eba361ae3c64d97f245709a6dd25c3cec2e327761e8a7b7ac8/mxnet_cu90-1.0.1b20180201-py2.py3-none-manylinux1_x86_64.whl

# Install boost as dependency for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
	libboost-dev \
	libboost-system-dev \
	libboost-filesystem-dev


RUN	pip install --no-cache-dir --upgrade xgboost && \
	pip install --no-cache-dir --upgrade lightgbm --install-option=--gpu \
		--install-option="--opencl-include-dir=/usr/local/cuda/include/" --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"


# Install pytorch and torch vision
RUN pip --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu90/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl


RUN pip --no-cache-dir install --upgrade torchvision \
	visdom\
	git+https://github.com/lanpa/tensorboard-pytorch


# Install Tensorpack latest
RUN pip install --no-cache-dir --upgrade git+git://github.com/ppwwyyxx/tensorpack


# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH


# TensorBoard
EXPOSE 6006


# Visdom
EXPOSE 8097
