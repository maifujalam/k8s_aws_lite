#!/bin/bash

set -eou pipefail

if [ -z "${AWS_ACCESS_KEY_ID:-}" ] || [ -z "${AWS_SECRET_ACCESS_KEY:-}" ];then
  echo "AWS AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY is not set"
  exit 1
fi


kubectl -n jenkins delete secret aws-secret
kubectl -n jenkins create secret generic aws-secret --from-literal=AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
--from-literal=AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
