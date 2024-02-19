FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y vim 
#    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY ./go1.22.0.linux-amd64.tar.gz ./

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

COPY ./config/vimrc /etc/vim/vimrc

CMD ["bash"]

