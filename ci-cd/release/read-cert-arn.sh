#!/usr/bin/env bash

CFN_OUTPUT_ARN=$(grep \
  -e "techeule-blogq-app-certificate\\.blogquiwebappcertificatecertoutput = (.*)\$" \
  -E \
  $1 | cut -d "=" -f 2)

echo "${CFN_OUTPUT_ARN//[[:space:]]/}"
