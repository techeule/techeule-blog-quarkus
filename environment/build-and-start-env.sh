#!/usr/bin/env bash

HERE_FOLDER=$(dirname "$0")
ROOT_FOLDER=$(cd "$HERE_FOLDER" && cd ../ && pwd)

WAITING_SEC=${1:-10}

$HERE_FOLDER/start-infra.sh

docker compose -f "$ROOT_FOLDER/environment/blogq-docker/docker-compose.yml" up -d --build
