FROM golang:1.22

RUN apt-get update && \
    apt-get install -y vim
#    rm -rf /var/lib/apt/lists/*

COPY ./config/vimrc /etc/vim/vimrc

WORKDIR /usr/src/app

CMD ["bash"]

