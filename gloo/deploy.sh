#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$( dirname "$0" )" >/dev/null && pwd )"

helm repo add gloo https://storage.googleapis.com/solo-public-helm
helm repo update

helm upgrade --install gloo gloo/gloo \
  --version "1.7.1" \
  --create-namespace \
  --namespace gloo-system \
  --values $SCRIPT_DIR/values.yaml \
  --wait --timeout 300s

kubectl apply -f $SCRIPT_DIR/virtual-service.yaml
