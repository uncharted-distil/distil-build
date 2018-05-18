#!/bin/bash
docker build -t docker.uncharted.software/distil-build:0.9 .
docker tag docker.uncharted.software/distil-build:0.9 docker.uncharted.software/distil-build:latest
