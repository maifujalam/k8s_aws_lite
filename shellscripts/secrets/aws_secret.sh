#!/bin/bash

set -eou pipefail

if [ -z "${AWS_ACCESS_KEY_ID:-}" ] || [ -z "${AWS_SECRET_ACCESS_KEY:-}" ];then
  echo "❌ AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY is not set"
  exit 1
fi


kubectl -n jenkins delete secret aws-secret --ignore-not-found
kubectl -n jenkins create secret generic aws-secret --from-literal=AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
--from-literal=AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} --ignore-not-found

kubectl -n cert-manager delete secret aws-credentials-secret --ignore-not-found
kubectl -n cert-manager create secret generic aws-credentials-secret \
--from-literal=aws_access_key_id=${AWS_ACCESS_KEY_ID} --from-literal=aws_secret_access_key=${AWS_SECRET_ACCESS_KEY} --ignore-not-found

