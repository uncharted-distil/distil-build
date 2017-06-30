#!/bin/bash
docker build -t docker.uncharted.software/distil-build:0.6 .
docker tag docker.uncharted.software/distil-build:0.6 docker.uncharted.software/distil-build:latest
