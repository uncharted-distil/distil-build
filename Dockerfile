FROM golang:1.13.1-alpine3.10

RUN apk update && apk add curl git openssh-client npm gcc
RUN npm install -g yarn

RUN go get -u golang.org/x/lint/golint
RUN go get -u github.com/golang/dep/cmd/dep

RUN mkdir -p src/github.com/uncharted-distil/distil
RUN mkdir -p src/github.com/uncharted-distil/distil-ingest

ADD ./build.sh /
