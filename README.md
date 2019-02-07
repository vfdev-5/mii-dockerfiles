# My various dockerfiles

Storage of dockerfiles :

- Datascience with python3 on CUDA10.0, CuDNN7, Ubuntu 16.04  
  - Base :
    - `python3, pip, numpy, pandas, matplotlib, sklearn, scipy, scikit-image, Pillow, opencv, gdal, shapely, ...`
  - ML/DL :
    - `pytorch, torchvision, Keras, tensorflow-gpu, xgboost, tensorpack`

- Datascience with python2 (same as previous)

## How to build ML/DL images

```
docker build -t datascience-py3-base:latest mii-dockerfiles/datascience-py3/base/
docker build -t datascience-py3-mldl:latest mii-dockerfiles/datascience-py3/mldl/
```

## How to run a docker container (interactive mode)

```
docker run --runtime=nvidia -it -p 8888:8888 -p 6006:6006 datascience-py3-mldl:latest
```

## How to run `jupyter`

- For security reasons it is advised to have `https` connection and setup a password.
```
# On host machine, generate a private key and a certificate for https connections
docker run -it --rm -v ~/.jupyter/:/root/.jupyter/ datascience-py3-base:latest openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /root/.jupyter/mykey.key -out /root/.jupyter/mycert.pem

# Generate password hash
docker run -it --rm datascience-py3-base:latest python3 -c "from notebook.auth import passwd; print(passwd())"
> sha1:xxxxxxxxx:xxxxxxxxxxxxxxx
```
- Create a container:

```
docker run --runtime=nvidia \
    --name jupyter \
    -p 8888:8888 \
    -p 6006:6006 \
    -v ~/.jupyter/mykey.key:/root/.jupyter/mykey.key \
    -v ~/.jupyter/mycert.pem:/root/.jupyter/mycert.pem \
    datascience-py3-mldl:latest \
    jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root --no-browser \
        --NotebookApp.keyfile=/root/.jupyter/mykey.key \
        --NotebookApp.certfile=/root/.jupyter/mycert.pem \
        --NotebookApp.password='sha1:xxxxxxxxx:xxxxxxxxxxxxxxx'
```

- [ref](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook)
- [a tutorial](http://tuatini.me/part-2-how-to-setup-your-own-environment-for-deep-learning-for-remote/)
