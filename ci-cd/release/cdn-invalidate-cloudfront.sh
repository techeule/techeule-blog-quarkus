#!/usr/bin/env bash

DISTRIBUTION_ID=$(grep \
  -e "t12s-blogq-app\\.cloudfrontdistributionidoutput = (.*)\$" \
  -E \
  $1 | cut -d "=" -f 2)

DISTRIBUTION_ID="${DISTRIBUTION_ID//[[:space:]]/}"

if [[ "x${DISTRIBUTION_ID}" == "x" ]]; then
  echo "No DISTRIBUTION_ID found for t12s-blogq-app.cloudfrontdistributionidoutput"
  exit 0
fi

echo "Creating distribution invalidation for distribution-id='${DISTRIBUTION_ID}'"
INVALIDATION_ID=$(aws cloudfront create-invalidation --distribution-id "${DISTRIBUTION_ID}" --paths "/*" | jq -r '.Invalidation.Id' )

if [[ "x${INVALIDATION_ID}" == "x" ]]; then
    echo "No INVALIDATION_ID=${INVALIDATION_ID} found for DISTRIBUTION_ID=${DISTRIBUTION_ID}"
    exit 0
fi

echo "Wait until the invalidation ${INVALIDATION_ID} is over"
aws cloudfront wait invalidation-completed --distribution-id "${DISTRIBUTION_ID}" --id "${INVALIDATION_ID}" || true
