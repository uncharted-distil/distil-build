#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -v $GOPATH/src/github.com/unchartedsoftware/distil-server:/go/src/github.com/unchartedsoftware/distil-server \
    docker.uncharted.software/distil-build:0.1 \
     
