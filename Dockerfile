FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

LABEL description="Pytorch and friends"

ARG PYTHON_VERSION=3.7

ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
    build-essential \
    curl \
    wget \
    gdal-bin \
    libgdal-dev \
    graphviz \
    git \
    p7zip-full \
    cmake && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -o ~/miniconda.sh -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    conda update -q conda && \
    conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include cython typing && \
    conda install pytorch torchvision cudatoolkit=10.0 -c pytorch && \
    conda install gdal && \
    conda clean -ya

RUN pip install --upgrade pip && \
      pip install --no-cache-dir numpy && \
      pip uninstall -y pillow && \
      CC="cc -mavx2" pip install --no-cache-dir --force-reinstall pillow-simd && \
      pip install --no-cache-dir \
      	scipy \
      	matplotlib \
        seaborn \
      	pandas \
      	scikit-learn \
      	scikit-image \
      	scikit-fmm \
        statsmodels \
      	Cython \
      	opencv-python \
      	h5py \
      	pydot \
      	graphviz \
      	shapely \
        shapely[vectorized] \
        fiona \
      	joblib \
      	rasterio \
        tqdm && \
        apt-get update && apt-get install -y --no-install-recommends \
        	libboost-dev \
        	libboost-system-dev \
        	libboost-filesystem-dev && \
        pip install --no-cache-dir --upgrade xgboost && \
	      pip install --no-cache-dir --upgrade lightgbm && \
        pip --no-cache-dir install --upgrade visdom \
	        git+https://github.com/lanpa/tensorboard-pytorch \
          protobuf tensorboard tensorflow && \
        pip install --no-cache --no-deps \
	         git+https://github.com/pytorch/ignite.git && \
        pip install --no-cache-dir imbalanced-learn iterative-stratification

# For CUDA profiling
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
