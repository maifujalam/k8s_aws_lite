#!/bin/bash
set -e

# Pass version as first argument, e.g. ./install-terraform.sh 1.5.8
TERRAFORM_VERSION=1.15.8

# Download and install
curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip
unzip -o /tmp/terraform.zip -d /usr/local/bin
rm -f /tmp/terraform.zip

terraform version
