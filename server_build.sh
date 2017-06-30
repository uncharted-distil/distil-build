#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -w /go/src/github.com/unchartedsoftware/distil \
    -v $GOPATH/src/github.com/unchartedsoftware/distil:/go/src/github.com/unchartedsoftware/distil \
    docker.uncharted.software/distil-build:latest \
    /bin/sh -c /build.sh
