FROM golang:1.8-alpine

RUN apk update
RUN apk add curl
RUN apk add git
RUN apk add nodejs

RUN npm install -g yarn

RUN mkdir -p src/github.com/unchartedsoftware/distil-server

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/Masterminds/glide


