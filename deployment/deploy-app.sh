#!/bin/bash

if [ -z "${1}" ]; then
    echo "Image tag needs to be passed in order to build image..!"
    echo "E.g bash deploy-app.sh 0.0.1"
    exit 1
fi

echo "Assuming minikube context of minikube..."

export NEW_IMAGE="http-server:${1}"

yq e '.spec.template.spec.containers[0].image = env(NEW_IMAGE)' -i k8s/deployment.yaml

unset NEW_IMAGE

for config in $(ls k8s); do
    kubectl --context minikube -n default apply -f k8s/${config}
done
