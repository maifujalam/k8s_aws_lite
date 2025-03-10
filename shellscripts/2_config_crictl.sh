#!/bin/bash
PROJECT_PATH=~/k8s_aws
KUBERNETES_VERSION=v1.31.1
printf "\nConfiguring crictl\n"
#### Download crictl #######
#VERSION="v1.30.1"
#if [[ ! -f  /vagrant/ShellScripts/crictl-$VERSION-linux-amd64.tar.gz ]];then
#  printf "Downloading crictl binary"
#  wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz
#fi
#sudo tar zxf /vagrant/ShellScripts/crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
############ Configure crictl ##########################
sudo cp $PROJECT_PATH/k8s/$KUBERNETES_VERSION/configs/config.toml /etc/containerd/ -vf
sudo systemctl restart containerd.service
#sudo chmod -R 777 /var/run/containerd/
sudo cp $PROJECT_PATH/k8s/$KUBERNETES_VERSION/configs/crictl.yaml /etc/ -vf
sudo crictl version
sudo printf "\nChecking All containers..\n\n"
sudo crictl ps
