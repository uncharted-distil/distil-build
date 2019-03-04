#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -w /go/src/github.com/uncharted-distil/distil \
    -v $GOPATH/src/github.com/uncharted-distil/distil:/go/src/github.com/uncharted-distil/distil \
    docker.uncharted.software/distil-build:latest \
    /bin/sh -c /build.sh
