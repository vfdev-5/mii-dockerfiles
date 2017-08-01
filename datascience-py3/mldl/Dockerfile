FROM datascience-py3-base:latest
MAINTAINER vfdev-mii

LABEL version="0.2"
LABEL description="Machine learning and deep learning python3/GPU setup"

# Install tensorflow, theano, keras, mxnet
RUN pip3 install --no-cache-dir \
	tensorflow-gpu \
	theano \
	keras \
	mxnet-cu80 \
	tensor2tensor \
	xgboost

# Install pytorch and torch vision
RUN pip3 --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu80/torch-0.1.12.post2-cp35-cp35m-linux_x86_64.whl

RUN pip --no-cache-dir install --upgrade torchvision

