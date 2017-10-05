# My various dockerfiles

Storage of dockerfiles :

- Datascience with python3 on CUDA8.0, CuDNN5.1, Ubuntu 16.04  
  - Base :
    - `python3, pip, numpy, pandas, matplotlib, sklearn, scipy, scikit-image, Pillow, opencv, gdal, shapely, ...`
  - ML/DL :
    - `Keras, tensorflow-gpu (1.2.0), mxnet-cu80, pytorch, torchvision, theano, tensor2tensor, xgboost, tensorpack`

- Datascience with python2 (same as previous)

- Mining
  - `ccminer`
  - `nheqminer`

## How to build ML/DL images

```
docker build -t datascience-py3-base:latest mii-dockerfiles/datascience-py3/base/
docker build -t datascience-py3-mldl:latest mii-dockerfiles/datascience-py3/mldl/
```

## How to run a docker container

```
nvidia-docker run -it -p 8888:8888 -p 6006:6006 datascience-py3-mldl:latest
```

## How to run `jupyter`

For security reasons it is advised to have `https` connection and setup a password. 
```
# On host machine: generate a private key and a certificate for https connections
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout ~/.jupyter/mykey.key -out ~/.jupyter/mycert.pem
# Generate password hash
docker run datascience-py3-base:latest python -c "from notebook.auth import passwd; print(passwd())"
```

- [a tutorial](http://tuatini.me/part-2-how-to-setup-your-own-environment-for-deep-learning-for-remote/)
