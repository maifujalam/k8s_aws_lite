#!/bin/bash
VERSION=v4.44.6
BINARY=yq_linux_amd64
wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /tmp/yq
chmod +x /tmp/yq
cp /tmp/yq /usr/local/bin/yq