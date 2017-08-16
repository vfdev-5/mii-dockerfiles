FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
MAINTAINER vfdev-mii

# Update all
RUN apt-get update

# Install Autoconf
RUN apt-get install -y libboost-all-dev cmake

# Install GIT
RUN apt-get install -y git

# Clone and build ccminer
RUN git clone -b Linux https://github.com/etherchain-org/nheqminer

RUN cd nheqminer/Linux_cmake/nheqminer_cuda_tromp && cmake . && make -j8
