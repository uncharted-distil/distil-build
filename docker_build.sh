#!/bin/bash
source ./config.sh
docker build -t $DOCKER_REPO/$DOCKER_IMAGE:$IMAGE_VERSION .
docker tag $DOCKER_REPO/$DOCKER_IMAGE:$IMAGE_VERSION $DOCKER_REPO/$DOCKER_IMAGE:latest
