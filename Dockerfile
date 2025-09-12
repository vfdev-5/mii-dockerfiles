FROM nvidia/cuda:12.9.1-cudnn-devel-ubuntu24.04

LABEL description="Cuda/CuDNN, Conda, Pytorch and friends"

ENV PATH=/opt/venv/bin:$PATH

RUN apt-get update && ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y --no-install-recommends --allow-unauthenticated \
    curl \
    wget \
    git \
    p7zip-full \
    cmake && \
    apt-get install -y python3 python3-pip python3-dev python3-venv --no-install-recommends && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/venv

RUN pip install --upgrade pip && \
    pip install torch torchvision --index-url https://download.pytorch.org/whl/cu129 && \
    pip install --no-cache-dir \
    scipy \
    matplotlib \
    seaborn \
    pandas \
    scikit-learn \
    scikit-image \
    Cython \
    opencv-python-headless \
    tqdm \
    pytorch-ignite
