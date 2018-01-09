#!/bin/bash
docker build -t docker.uncharted.software/distil-build:0.7 .
docker tag docker.uncharted.software/distil-build:0.7 docker.uncharted.software/distil-build:latest
