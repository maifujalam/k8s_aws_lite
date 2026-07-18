#!/bin/bash
printf "\n\nDownloading Images for k8s 1.36.2\n\n"
kubeadm config images list --kubernetes-version v1.36.2
kubeadm config images pull --kubernetes-version v1.36.2
printf "\n\nDownload Images for k8s 1.36.2 is Successful. \n\n"