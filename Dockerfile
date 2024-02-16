FROM golang:1.22 AS build-stage

WORKDIR /usr/src/app

COPY ./. ./

WORKDIR /usr/src/app/greetings

RUN go test -v

WORKDIR /usr/src/app/hello

RUN GOOS=linux go build -v -o /usr/local/bin/hello -buildvcs=false

CMD ["hello"]

