#!/usr/bin/env bash

MAX_TRIES=$1
URL=$2

tries=0

echo "tries=$tries"

while ! curl --fail "${URL}"; do
  sleep 1
  tries=$((tries + 1))
  echo "$tries tries"
  if [[ $tries -ge $MAX_TRIES ]]; then exit 1; fi
done
