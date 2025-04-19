#!/bin/bash
set -euo pipefail
if [ -z "${GIT_TOKEN:-}" ];then
  echo "GIT_TOKEN is not set"
  exit 1
fi
kubectl -n jenkins delete secret git-secret
kubectl -n jenkins create secret generic git-secret --from-literal=GIT_TOKEN=${GIT_TOKEN}