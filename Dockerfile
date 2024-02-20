FROM golang:1.22

RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y ca-certificates

WORKDIR /usr/src/app

COPY ./config/vimrc /etc/vim/vimrc

COPY ./config/cisco.crt /usr/local/share/ca-certificates/cisco.crt

RUN update-ca-certificates


CMD ["bash"]

