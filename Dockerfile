FROM ubuntu:14.04
MAINTAINER John Axel Eriksson <john@insane.se>

ADD . /testci
WORKDIR /testci

RUN apt-get update &&\
    groupadd --gid 1337 testci &&\
    useradd -d /testci -M --uid 1337 --gid testci --shell /bin/bash testci &&\
    chown -R testci:testci /testci &&\
    apt-get clean &&\
    apt-get autoremove -y -q &&\
    apt-get autoclean -y -q &&\
    rm -rf /tmp/* &&\
    rm -rf /var/tmp/* &&\
    rm -rf /var/lib/apt/lists/*

USER testci
ENV PATH /testci/bin:$PATH
ENV SHELL /bin/bash
ENV HOME /testci
