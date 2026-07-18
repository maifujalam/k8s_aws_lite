#!/bin/bash
VERSION="v4.2.3"
printf "Installing Helm $VERSION\n"

if [[ ! -f /tmp/helm-$VERSION-linux-amd64.tar.gz ]]; then
  echo "Downloading Binary.."
  wget -O /tmp/helm-$VERSION-linux-amd64.tar.gz https://get.helm.sh/helm-$VERSION-linux-amd64.tar.gz
fi

sudo tar zxf /tmp/helm-$VERSION-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/local/bin/
rm -frv linux-amd64
