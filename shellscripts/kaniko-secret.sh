#!/usr/bin/env bash

DOCKER_USERNAME=skmaifujalam
DOCKER_PASSWORD=$DOCKER_PASSWORD

kubectl create secret docker-registry docker-credentials --docker-username=$DOCKER_USERNAME \
--docker-password=$DOCKER_PASSWORD --docker-email=sk.maifujalam@gmail.com  --namespace jenkins
