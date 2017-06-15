#!/bin/sh
glide install && \
    yarn install && \
    yarn build  && \
    go build -ldflags "-X main.version=`git describe --tags` -X main.timestamp=`date +%FT%T%z`"