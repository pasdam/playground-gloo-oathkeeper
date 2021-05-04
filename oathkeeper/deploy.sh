#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$( dirname "$0" )" >/dev/null && pwd )"

JWKS_PATH=$SCRIPT_DIR/jwks.json
if [ ! -f "$JWKS_PATH" ]; then
  echo "Generating JWKS file"
  docker run --rm oryd/oathkeeper:v0.38.9-alpine credentials generate --alg HS256 > $JWKS_PATH
fi

helm repo add ory https://k8s.ory.sh/helm/charts
helm repo update

helm upgrade --install oathkeeper ory/oathkeeper \
  --create-namespace \
  --namespace oathkeeper \
  --values $SCRIPT_DIR/values.yaml \
  --set-file "oathkeeper.mutatorIdTokenJWKs=$SCRIPT_DIR/jwks.json" \
  --set-file "oathkeeper.accessRules=$SCRIPT_DIR/rules.yaml" \
  --wait --timeout 100s
