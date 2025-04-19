#!/bin/bash
kubectl -n jenkins delete secret git-secret
kubectl -n jenkins create secret generic git-secret --from-literal=GIT_TOKEN=${GIT_TOKEN}