FROM golang:latest

RUN apt-get update && \
    apt-get install -y vim
#    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/hello

CMD ["go", "run", "."]

