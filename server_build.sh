#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -w /go/src/github.com/unchartedsoftware/distil-server \
    -v $GOPATH/src/github.com/unchartedsoftware/distil:/go/src/github.com/unchartedsoftware/distil \
    docker.uncharted.software/distil-build:0.5 \
    /bin/sh -c "./build.sh"
