#!/bin/bash
JQ_VERSION="1.7.1"
URL=https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-amd64

printf "Installing jq $JQ_VERSION\n"
if [[ ! -f /tmp/jq ]];then
  echo "Downloading Binary.."
  wget jq $URL
fi
chmod +x jq-linux-amd64
cp jq-linux-amd64 /usr/local/bin/jq
