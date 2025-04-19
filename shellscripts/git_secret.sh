#!/bin/bash
kubectl -n jenkins create secret generic git-secret --from-literal=GIT_TOKEN=${GIT_TOKEN}