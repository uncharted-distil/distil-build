FROM golang:1.10.1-alpine

RUN apk update && apk add curl git nodejs openssh-client

RUN npm install -g yarn

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/golang/dep/cmd/dep

RUN mkdir -p src/github.com/unchartedsoftware/distil
RUN mkdir -p src/github.com/unchartedsoftware/distil-ingest

RUN mkdir -p -m 700 /root/.ssh;
COPY circle_ci_rsa.pub config /root/.ssh/
RUN chmod 600 /root/.ssh/circle_ci_rsa.pub
RUN chmod 400 /root/.ssh/config
ADD ./build.sh /
