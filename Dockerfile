FROM docker-hub.uncharted.software/golang:1.15.6-alpine3.12

RUN apk update && apk add curl git openssh-client npm make build-base

RUN apk add gdal gdal-dev

RUN npm install -g yarn

RUN mkdir -p src/github.com/uncharted-distil/distil
RUN mkdir -p src/github.com/uncharted-distil/distil-ingest

RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.33.0

ADD ./build.sh /
