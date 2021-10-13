#!/usr/bin/env bash

# kubectl

config_pods(){
    mkdir -p ~/.kube && curl -H 'Accept: application/json' -u $USER https://cloud-portal.bookinggo.app/my/kubeconfig >> ~/.kube/config
    kubectl config get-contexts
    kubectl config use-context eu-west-2-dev
    kubectl config set contexts.eu-west-2-dev.namespace supplier-integrations
    kubectl config get-contexts
    kubectl get pods
}

if [ -x "$(command -v kubectl)" ]; then
    echo "kubectl installed"
    config_pods()
 else
    brew install kubectl
    config_pods()
fi

