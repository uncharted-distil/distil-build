FROM ubuntu:18.04

# update libraries, including GDAL for geotiff processing
RUN apt-get update && \
    apt-get install -y software-properties-common curl libpq-dev && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:ubuntugis/ppa && \
    apt-get update && \
    apt-get -y install build-essential openssh-client git wget unzip gdal-bin gdal-data libgdal-dev libgdal-perl libgdal-perl-doc python3-gdal

# setup node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

# setup golang + env vars to support main app build
RUN wget -O go.tar.gz https://golang.org/dl/go1.15.7.linux-amd64.tar.gz && tar -C /usr/local -xzf go.tar.gz
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go
ENV PATH=$PATH:$GOPATH/bin

# add gdal env vars to support cgo build of gdal wrapper lib
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# add tensorflow libraries to support build of image upscale lib
RUN mkdir /usr/local/tensorflow && \
    wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-2.4.0.tar.gz -P /usr/local/tensorflow && \
    tar -C /usr/local/tensorflow -xzf /usr/local/tensorflow/libtensorflow-gpu-linux-x86_64-2.4.0.tar.gz && \
    mkdir -p /usr/local/lib && \
    cp -a /usr/local/tensorflow/lib/. /usr/local/lib  && \
    rm -rf /usr/local/tensorflow && \
    ldconfig

# install our javascript dependencies
RUN npm install -g yarn

# create source directories that will linked to container-external dirs during build
RUN mkdir -p src/github.com/uncharted-distil/distil
RUN mkdir -p src/github.com/uncharted-distil/distil-ingest

# installing linting for execution during build
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.33.0

# add our build script
ADD ./build.sh /
