#!/bin/bash

set -euo pipefail  # Run: bash kaniko-secret.sh
# e: exit immediately if any command exit with non zero.
# u: Consider unset value as an error and exit
# -o pipefail:  If there is any intermittent pipe fails in the script.The entire script fails.

# Ensure DOCKER_PASSWORD is set
if [ -z "${DOCKER_PASSWORD:-}" ]; then  # -z: means if empty value
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
