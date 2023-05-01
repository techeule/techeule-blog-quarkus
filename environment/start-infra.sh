#!/usr/bin/env bash

HERE_FOLDER=$(dirname "$0")
ROOT_FOLDER=$(cd "$HERE_FOLDER" && cd ../ && pwd)

docker compose -f "$ROOT_FOLDER/environment/blogq-docker/docker-compose.yml" up -d t12s-db-postgres t12s-oidc-keycloak
