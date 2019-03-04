FROM golang:1.10.1-alpine

RUN apk update && apk add curl git nodejs openssh-client

RUN npm install -g yarn

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/golang/dep/cmd/dep

RUN mkdir -p src/github.com/uncharted-distil/distil
RUN mkdir -p src/github.com/uncharted-distil/distil-ingest

ADD ./build.sh /
