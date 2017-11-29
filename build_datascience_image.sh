#!/bin/bash

help() {
    echo "No argument supplied. Usage sh build_datascience_image.sh <python-verion> <type> <tag>"
    echo "    <python-version> : py2, py3"
    echo "    <type> : base, mldl"
    echo "    <tag> :  whatever tag"
}

echo $1 $2 $3

if [ -z $3  ]; then
    help
    exit 1
fi

py_version=$1
type=$2
tag=$3

if [ "${py_version}" != "py2" ] && [ "${py_version}" != "py3" ]; then
    echo "Unknown python-version ${py_version}"
    help
    exit 1
fi

if [ "${type}" != "base" ] && [ "${type}" != "mldl" ]; then
    echo "Unknown python-version ${py_version}"
    help
    exit 1
fi

echo ""
echo "Build datascience image ${py_version} ${type}:${tag}"
echo ""

docker build -t datascience-${py_version}-${type}:${tag} datascience-${py_version}/${type}/
