#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "ERROR - missing path to circle_ci private key file"
    exit -1
fi

docker build --build-arg rsakey="$(cat $1)" -t docker.uncharted.software/distil-build:0.7 .
docker tag docker.uncharted.software/distil-build:0.7 docker.uncharted.software/distil-build:latest
