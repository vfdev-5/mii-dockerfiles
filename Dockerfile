FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04

LABEL description="Cuda/CuDNN, Conda, Pytorch 1.13.1 and friends"

ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y --no-install-recommends --allow-unauthenticated \
    curl \
    wget \
    git \
    p7zip-full \
    cmake && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    conda update -q conda && \
    conda install pytorch torchvision pytorch-cuda=11.6 -c pytorch -c nvidia && \
    conda clean -ya && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
      pip install --no-cache-dir \
      scipy \
      matplotlib \
      seaborn \
      pandas \
      scikit-learn \
      scikit-image \
      Cython \
      opencv-python-headless \
      h5py \
      tqdm \
      pytorch-ignite

RUN pip uninstall -y pillow && CC="cc -mavx2" pip install --no-cache-dir --force-reinstall pillow-simd
