#!/usr/bin/env bash
kubectl -n jenkins delete secret kubeconfig-secret --ignore-not-found
kubectl -n jenkins create secret generic kubeconfig-secret --from-file=KUBECONFIG=$HOME/.kube/config
echo "kubeconfig-secret created in kube-system namespace"