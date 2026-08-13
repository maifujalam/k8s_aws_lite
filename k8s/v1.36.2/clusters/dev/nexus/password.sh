#!/usr/bin/env bash

NEXUS_ROOT_PASSWORD=${NEXUS_ROOT_PASSWORD}
#echo ${NEXUS_ROOT_PASSWORD}
kubectl create secret generic nexus-admin-secret --from-literal=password='${NEXUS_ROOT_PASSWORD}' -n nexus