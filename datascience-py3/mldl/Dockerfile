FROM datascience-py3-base:cuda9_cudnn7
MAINTAINER vfdev-mii

LABEL version="0.3"
LABEL description="Machine learning and deep learning python3/GPU setup"


# Install tensorflow, pytorch, keras
RUN pip3 install --no-cache-dir --upgrade \
	tensorflow-gpu \
	tensorboard \
	keras

# Install boost as dependency for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
	libboost-dev \
	libboost-system-dev \
	libboost-filesystem-dev


RUN	pip3 install --no-cache-dir --upgrade xgboost && \
	pip3 install --no-cache-dir --upgrade lightgbm --install-option=--gpu \
		--install-option="--opencl-include-dir=/usr/local/cuda/include/" --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"

# Install pytorch-nightly + LibTorch, torchvision, ignite
RUN pip3 --no-cache-dir install torch

RUN pip3 --no-cache-dir install --upgrade torchvision \
	visdom \
	git+https://github.com/lanpa/tensorboard-pytorch
	
RUN pip3 install --no-cache-dir --no-deps --upgrade git+https://github.com/pytorch/ignite.git

# Some other useful packages:
RUN pip3 install --no-cache-dir imbalanced-learn \
	iterative-stratification


# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH


# TensorBoard
EXPOSE 6006


# Visdom
EXPOSE 8097