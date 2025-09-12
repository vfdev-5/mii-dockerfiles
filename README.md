# Pytorch and ML/CV/Stats friends docker image

- python 3.12
- pytorch 2.X and cuda 12.9
- torchvision, ignite
- scikit-learn, matplotlib ...
- opencv
- ...


## How to build image

```
docker build -t vfdev5/mii-dockerfiles:latest .
docker build -t vfdev5/mii-dockerfiles:jupyter . -f Dockerfile.jupyterlab
```
