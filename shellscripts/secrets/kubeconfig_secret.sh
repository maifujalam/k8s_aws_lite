#!/usr/bin/env bash
kubectl -m jenkins create secret generic kubeconfig-secret --from-file=kubeconfig=$HOME/.kube/config
echo "kubeconfig-secret created in kube-system namespace"