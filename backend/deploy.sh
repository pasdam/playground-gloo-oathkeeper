#!/usr/bin/env bash

kubectl apply -f https://raw.githubusercontent.com/solo-io/demo-echo-server/master/k8s/deployment.yaml
kubectl set image deployment/echo-server echo-server=quay.io/solo-io/echo-server:v1
kubectl apply -f https://raw.githubusercontent.com/solo-io/demo-echo-server/master/k8s/service.yaml
