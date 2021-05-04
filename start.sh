#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$( dirname "$0" )" >/dev/null && pwd )"

$SCRIPT_DIR/k3d/create_cluster.sh
$SCRIPT_DIR/backend/deploy.sh
$SCRIPT_DIR/oathkeeper/deploy.sh
$SCRIPT_DIR/gloo/deploy.sh
