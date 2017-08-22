# My various dockerfiles

Storage of dockerfiles :

- Datascience with python3 on CUDA8.0, CuDNN5.1, Ubuntu 16.04  
  - Base :
    - `python3, pip, numpy, pandas, matplotlib, sklearn, scipy, scikit-image, Pillow, opencv, gdal, shapely, ...`
  - ML/DL :
    - `Keras, tensorflow-gpu (1.2.0), mxnet-cu80, pytorch, torchvision, theano, tensor2tensor, xgboost, tensorpack`

- Mining
  - `ccminer`
  - `nheqminer`

## How to build ML/DL image:

```
docker build -t datascience-py3-base:latest mii-dockerfiles/datascience-py3/base/
docker build -t datascience-py3-mldl:latest mii-dockerfiles/datascience-py3/mldl/
```

## How to run docker container

```
nvidia-docker run -it -p 8888:8888 -p 6006:6006 datascience-py3-mldl:latest
```
