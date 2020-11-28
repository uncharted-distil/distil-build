FROM docker-hub.uncharted.software/golang:1.14.2-alpine3.11

RUN apk update && apk add curl git openssh-client npm make build-base

RUN apk add gdal gdal-dev

RUN npm install -g yarn

RUN go get -u golang.org/x/lint/golint
RUN go get -u github.com/golang/dep/cmd/dep

RUN mkdir -p src/github.com/uncharted-distil/distil
RUN mkdir -p src/github.com/uncharted-distil/distil-ingest

ADD ./build.sh /
