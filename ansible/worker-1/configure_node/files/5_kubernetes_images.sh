#!/bin/bash
printf "\n\nDownloading Images for k8s\n\n"
kubeadm config images list
sudo kubeadm config images pull
printf "\n\nDownload Images for k8s  is Successful. \n\n"
