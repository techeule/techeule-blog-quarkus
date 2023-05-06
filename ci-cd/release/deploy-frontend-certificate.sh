#!/usr/bin/env bash

DEPLOYMENT_REGION=us-east-1 cdk deploy --require-approval never --strict "$@" | tee t12s-blogq-frontend-web-app-certificate.deployment.out.txt

if [[ "x${PIPESTATUS[0]}" != "x0" ]]; then
  exit "${PIPESTATUS[0]}"
fi
