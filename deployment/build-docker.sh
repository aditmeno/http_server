#!/bin/bash

if [ -z "${1}" ]; then
    echo "Image tag needs to be passed in order to build image..!"
    echo "E.g bash build-docker.sh 0.0.1"
    exit 1
fi

cd ../
docker build -t http-server:${1} --build-arg=TAG=alpine3.15 .
cd deployment
minikube image load http-server:${1}
