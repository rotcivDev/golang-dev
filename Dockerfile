FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y systemctl && \
    apt-get install -y ca-certificates && \
    apt-get install -y libssl-dev && \
    apt-get install -y mysql-server
#    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY ./go1.22.0.linux-amd64.tar.gz ./

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

COPY ./config/vimrc /etc/vim/vimrc

COPY ./cisco.crt /usr/local/share/ca-certificates/cisco.crt

RUN update-ca-certificates

CMD ["bash"]

