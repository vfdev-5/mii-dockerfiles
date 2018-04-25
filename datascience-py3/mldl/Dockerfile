FROM datascience-py3-base:9.1-cudnn7
MAINTAINER vfdev-mii

LABEL version="0.3"
LABEL description="Machine learning and deep learning python3/GPU setup"

# Install boost as dependency for lightgbm
RUN apt-get update && apt-get install -y --no-install-recommends \
	libboost-dev \
	libboost-system-dev \
	libboost-filesystem-dev


RUN	pip3 install --no-cache-dir --upgrade xgboost && \
	pip3 install --no-cache-dir --upgrade lightgbm --install-option=--gpu \
		--install-option="--opencl-include-dir=/usr/local/cuda/include/" --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"


RUN pip3 install --no-cache-dir --upgrade catboost


RUN pip3 install --no-cache-dir --upgrade fbprophet


# Install pytorch and torch vision
RUN pip3 --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu91/torch-0.4.0-cp35-cp35m-linux_x86_64.whl


RUN pip3 --no-cache-dir install --upgrade torchvision \
	visdom\
	git+https://github.com/lanpa/tensorboard-pytorch


# Install tensorflow, keras
RUN pip3 install --no-cache-dir --upgrade \
	tensorflow-gpu \
	tensorboard \
	keras


# Install Tensorpack latest
RUN pip3 install --no-cache-dir --upgrade git+git://github.com/ppwwyyxx/tensorpack


# Install Pillow-SIMD
RUN pip3 uninstall -y pillow && \
	CC="cc -mavx2" pip3 install --no-cache-dir --upgrade --force-reinstall pillow-simd



# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH


# TensorBoard
# EXPOSE 6006


# Visdom
# EXPOSE 8097
