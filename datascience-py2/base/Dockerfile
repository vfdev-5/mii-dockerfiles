FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER vfdev-mii

LABEL version="0.2"
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
	gdal-bin \
	libgdal-dev \
	wget \
	python \
	python-dev \
	python-pip \
	graphviz \
	python-gdal \
	git \
  p7zip-full \
	cmake


RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip


# Install python packages
RUN pip install --no-cache-dir setuptools


RUN CC="cc -mavx2" pip install --no-cache-dir pillow-simd


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
	statsmodels \
	Cython \
	opencv-python \
	h5py \
	ipykernel \
	jupyter \
	pydot \
	graphviz \
	shapely \
  shapely[vectorized] \
  fiona \
	joblib \
  jupyterlab \
  kaggle-cli \
	rasterio


RUN pip install --no-cache-dir \
		pytest \
		flake8 \
		coveralls \
		pytest-cov


RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter serverextension enable --py jupyterlab --sys-prefix


# Expose port for jupyter notebook
EXPOSE 8888
