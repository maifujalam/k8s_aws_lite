FROM docker.io/jenkins/inbound-agent:3383.vc8881d4b_0e76-1-jdk25

COPY . .

USER root

# Update package list and install Helm
RUN yum -y update && yum install -y vim wget tar  && rm -rf /var/lib/apt/lists/*
RUN sh 8_install_helm.sh
RUN sh install-terraform.sh
RUN sh get_jq.sh
RUN sh get_yq.sh
RUN sh install_kubectl.sh

USER jenkins
