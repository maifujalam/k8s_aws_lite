#!/bin/bash
VERSION="v3.15.4"
printf "Installing Helm $VERSION\n"
if [[ ! -f /vagrant/ShellScripts/helm-$VERSION-linux-amd64.tar.gz ]];then
  echo "Downloading Binary.."
  wget https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz
fi
tar zxf helm-$VERSION-linux-amd64.tar.gz
cp linux-amd64/helm /usr/local/bin/
rm -frv linux-amd64

helm plugin install https://github.com/hypnoglow/helm-s3.git --version 0.16.2
#helm repo add public-helm-repository s3://public-helm-repository-20231023095000508500000001
#helm repo update
#helm s3 reindex public-helm-repository;
