FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER vfdev-mii

LABEL version="0.1"
LABEL description="Basic data-science python2 setup"


# Update all
RUN apt-get update


# Setup en_US locale
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


# Install dependencies:
RUN apt-get install -y --no-install-recommends \
	build-essential \
	curl \
	wget \
	python \
	python-dev \
	python-pip \
	graphviz \
	python-gdal \
	git


RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip


# Install python packages
RUN pip install --no-cache-dir setuptools


RUN pip install --no-cache-dir \
	wheel \
	numpy \
	scipy \
	matplotlib \
        seaborn \
	pandas \
	sklearn \
	scikit-image \
	scikit-fmm \
	Cython \
	opencv-python \
	Pillow \
	h5py \
	ipykernel \
	jupyter \
	pydot \
	shapely \
	joblib \
        jupyterlab \
        kaggle-cli


RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter serverextension enable --py jupyterlab --sys-prefix


# Expose port for jupyter notebook
EXPOSE 8888
