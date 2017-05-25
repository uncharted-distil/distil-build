FROM golang

RUN mkdir -p src/github.com/unchartedsoftware/distil-server

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN npm install -g yarn

RUN go get -u github.com/golang/lint/golint
RUN go get -u github.com/Masterminds/glide

#CMD bash
