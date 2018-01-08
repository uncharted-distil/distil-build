FROM golang:1.8-alpine

RUN apk update && apk add curl git nodejs openssh-client

RUN npm install -g yarn

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/Masterminds/glide

RUN mkdir -p src/github.com/unchartedsoftware/distil
RUN mkdir -p src/github.com/unchartedsoftware/distil-ingest

ARG rsakey
RUN test -n "${rsakey}" && { \
    mkdir -p -m 700 /root/.ssh; \
    echo "${rsakey}" > /root/.ssh/id_rsa; \
    chmod 600 /root/.ssh/id_rsa; \
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > /root/.ssh/config; \
    chmod 400 /root/.ssh/config; \
} || :

ADD ./build.sh /