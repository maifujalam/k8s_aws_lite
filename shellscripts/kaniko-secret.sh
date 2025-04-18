#!/bin/bash

set -euo pipefail  # Run: bash kaniko-secret.sh

# Ensure DOCKER_PASSWORD is set
if [ -z "${DOCKER_PASSWORD:-}" ]; then
  echo "❌ DOCKER_PASSWORD is not set. Please export it before running this script."
  exit 1
fi

DOCKER_USERNAME=skmaifujalam
DOCKER_EMAIL=sk.maifujalam@gmail.com
NAMESPACE=jenkins

# Create or replace the secret
kubectl delete secret docker-credentials --namespace $NAMESPACE --ignore-not-found

kubectl create secret docker-registry docker-credentials \
  --docker-username="$DOCKER_USERNAME" \
  --docker-password="$DOCKER_PASSWORD" \
  --docker-email="$DOCKER_EMAIL" \
  --namespace "$NAMESPACE"

echo "✅ Docker registry secret 'docker-credentials' created in namespace '$NAMESPACE'."
