#!/bin/bash

source ./config.sh
docker push $DOCKER_REPO/$DOCKER_IMAGE:latest
docker push $DOCKER_REPO/$DOCKER_IMAGE:$IMAGE_VERSION
