#!/bin/sh
yarn install && \
    yarn build  && \
    go build -ldflags "-X main.version=`git log --pretty=format:'%h' -n 1` -X main.timestamp=`date +%FT%T%z`"
