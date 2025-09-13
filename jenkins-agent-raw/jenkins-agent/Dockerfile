FROM jenkins/inbound-agent:3283.v92c105e0f819-8-rhel-ubi9-jdk17

COPY . .

USER root

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
# Update package list and install Helm
RUN yum -y update && yum install -y vim wget tar  && rm -rf /var/lib/apt/lists/*
RUN sh 8_install_helm.sh
RUN sh install-terraform.sh
RUN sh get_jq.sh
RUN sh get_yq.sh
RUN sh install_kubectl.sh

USER jenkins
