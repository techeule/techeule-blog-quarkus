#!/usr/bin/env bash

HERE_FOLDER=$(dirname "$0")
ROOT_FOLDER=$(cd "$HERE_FOLDER" && cd ../ && pwd)

WAITING_SEC=${1:-10}

$HERE_FOLDER/start-infra.sh

# echo "Waiting for ${WAITING_SEC} seconds before running the DB-Migration"
# sleep "${WAITING_SEC}"
# $HERE_FOLDER/run-database-migration.sh || (sleep 10 && $HERE_FOLDER/run-database-migration.sh) || exit 20

docker compose -f "$ROOT_FOLDER/environment/blogq-docker/docker-compose.yml" up -d --build
