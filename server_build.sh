#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -w /go/src/github.com/unchartedsoftware/distil-server \
    -v $GOPATH/src/github.com/unchartedsoftware/distil-server:/go/src/github.com/unchartedsoftware/distil-server \
    docker.uncharted.software/distil-build:0.3 \
    /bin/sh -c "glide install;yarn install;go build -i"