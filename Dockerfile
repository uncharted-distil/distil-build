FROM golang:1.8-alpine

RUN apk update
RUN apk add curl
RUN apk add git
RUN apk add nodejs

RUN npm install -g yarn

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/Masterminds/glide

RUN mkdir -p src/github.com/unchartedsoftware/distil
RUN mkdir -p src/github.com/unchartedsoftware/distil-ingest

ADD ./build.sh /


