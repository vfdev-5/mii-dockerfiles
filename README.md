# Pytorch and ML/CV/Stats friends docker image

- conda and python 3.9
- pytorch 2.3 and cuda 12.4
- torchvision, ignite
- scikit-learn, matplotlib ...
- opencv
- ...


## How to build image

```
docker build -t vfdev5/mii-dockerfiles:latest .
docker build -t vfdev5/mii-dockerfiles:jupyter . -f Dockerfile.jupyterlab
```
