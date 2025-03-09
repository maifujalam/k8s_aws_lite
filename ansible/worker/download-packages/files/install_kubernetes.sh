#!/bin/bash
KUBERNETES_MAJOR_VERSION=v1.30
#sudo apt-get -y update
#sudo apt-get install -y apt-transport-https ca-certificates curl gpg
sudo rm -rfv /etc/apt/keyrings/kubernetes-apt-keyring.gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/$KUBERNETES_MAJOR_VERSION/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$KUBERNETES_MAJOR_VERSION/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get -y update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet
