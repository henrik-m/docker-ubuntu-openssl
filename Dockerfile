FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y build-essential

ADD https://www.openssl.org/source/openssl-1.1.1h.tar.gz /tmp

WORKDIR /tmp
RUN tar -zxf openssl-1.1.1h.tar.gz

WORKDIR /tmp/openssl-1.1.1h
RUN ./config
RUN make install
RUN ln -s /usr/local/bin/openssl /usr/bin/openssl
RUN ldconfig

WORKDIR /
