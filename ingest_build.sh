#!/bin/bash
docker run \
    --rm \
    --name distil-build \
    -w /go/src/github.com/unchartedsoftware/distil-ingest \
    -v $GOPATH/src/github.com/unchartedsoftware/distil-ingest:/go/src/github.com/unchartedsoftware/distil-ingest \
    docker.uncharted.software/distil-build:latest \
    /bin/sh -c "dep ensure && go build -i"
