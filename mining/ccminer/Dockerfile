FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
MAINTAINER vfdev-mii

# Update all 
RUN apt-get update

# Install Autoconf
RUN apt-get install -y autoconf libssl-dev libcurl4-openssl-dev

# Install GIT
RUN apt-get install -y git

# Clone and build ccminer
RUN git clone https://github.com/tpruvot/ccminer

RUN cd ccminer && ./build.sh





