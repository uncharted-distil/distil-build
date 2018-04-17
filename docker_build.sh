#!/bin/bash
docker build -t docker.uncharted.software/distil-build:0.8 .
docker tag docker.uncharted.software/distil-build:0.8 docker.uncharted.software/distil-build:latest
