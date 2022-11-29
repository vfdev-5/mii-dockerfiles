# Pytorch and ML/CV/Stats friends docker image

- conda and python 3.9
- pytorch 1.13 and cuda 11.6
- torchvision, ignite
- scikit-learn, matplotlib ...
- opencv
- ...


## How to build image

```
docker build -t vfdev5/mii-dockerfiles:latest .
docker build -t vfdev5/mii-dockerfiles:jupyter . -f Dockerfile.jupyterlab
```
