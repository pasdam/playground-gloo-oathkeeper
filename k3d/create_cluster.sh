#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$( dirname "$0" )" >/dev/null && pwd )"

k3d cluster create --config $SCRIPT_DIR/config.yaml
