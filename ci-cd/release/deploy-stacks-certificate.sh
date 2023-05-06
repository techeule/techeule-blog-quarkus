#!/usr/bin/env bash


cdk deploy --require-approval never --strict $@ | tee api-app.deployment.out.txt

if [[ "x${PIPESTATUS[0]}" != "x0" ]]; then
  exit "${PIPESTATUS[0]}"
fi
