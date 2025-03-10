#!/bin/bash
REPO=docker.io/skmaifujalam/jenkins-agent
BUILD_TAG=v1.0.2

#docker build --build-arg AWS_ACCESS_KEY_ID=<Your_Access_Key_ID> --build-arg AWS_SECRET_ACCESS_KEY=<Your_Secret_Access_Key> -t $REPO:$BUILD_TAG .
docker build -t $REPO:$BUILD_TAG .
