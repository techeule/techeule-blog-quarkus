#!/usr/bin/env bash

HERE_FOLDER=$(dirname $0)
ROOT_FOLDER=$(cd "$HERE_FOLDER" ; cd ../ ; pwd)

docker compose -f "$ROOT_FOLDER/environment/blogq-docker/docker-compose.yml" down --volumes || true

if [[ "x$1" == "xstart" ]]; then
  $ROOT_FOLDER/environment/start-infra.sh
fi
