FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER vfdev-mii

LABEL version="0.3"
LABEL description="Basic data-science python3 setup"

# Update all 
RUN apt-get update

# Install dependencies:
RUN apt-get install -y --no-install-recommends \
	build-essential \
	curl \
	wget \
	python3 \
	python3-dev \
	python3-pip \
	graphviz \
	python3-gdal \
	git

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install --upgrade pip

# Install python packages
RUN pip3 install --no-cache-dir setuptools

RUN pip3 install --no-cache-dir \
	wheel \
	numpy \
	scipy \
	matplotlib \
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
	shapely

# Expose port for jupyter notebook
EXPOSE 8888

