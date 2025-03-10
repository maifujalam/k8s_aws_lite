#!/bin/bash

ARGOCD_SERVER="argocd.maifuj.com"
USERNAME=admin
PASSWORD=$(kubectl -n argo-cd get secret argocd-secret -o jsonpath="{.data.password}" | base64 -d)
# echo $PASSWORD

argocd login $ARGOCD_SERVER  --insecure  --username $USERNAME --password $PASSWORD --grpc-web #--skip-test-tls
#
#printf "\n Adding Argocd Repo.\n"
#argocd repo add git@github.com:maifujalam/k8s_vagrant.git --ssh-private-key-path ~/.ssh/id_rsa

#printf "\n Installing default Apps. \n"
#kubectl apply -f ../manifests/default-applications.yaml
argocd account create --username readonly --password readonly

kubectl get configmap argocd-rbac-cm -n argo-cd -o yaml > argocd-rbac-cm.yaml

printf "\nList of ArgoCD Apps\n"
argocd app list
