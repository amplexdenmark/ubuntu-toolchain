 ##
 # (C) Copyright 2018 Amplex, fm@amplex.dk
 ##
FROM virtual-cpu
#FROM ubuntu:16.04

MAINTAINER Flemming Madsen <amplexdenmark@gmail.com>

# From https://github.com/mlaccetti/docker-oracle-java8-ubuntu-16.04/blob/master/Dockerfile
ENV DEBIAN_FRONTEND noninteractive
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8

RUN apt-get update

RUN apt-get --no-install-recommends install -y build-essential

RUN apt-get --no-install-recommends install -y bc gawk subversion
RUN ln -sf libreadline.so.6 /lib/i386-linux-gnu/libreadline.so.5 && \
    ln -sf libhistory.so.6 /lib/i386-linux-gnu/libhistory.so.5 && \
    useradd -d /homedir --uid 500 user500 && \
    useradd -d /homedir --uid 501 user501 && \
    useradd -d /homedir --uid 502 user502 && \
    useradd -d /homedir --uid 503 user503 && \
    useradd -d /homedir --uid 504 user504 && \
    true
RUN apt-get --no-install-recommends install -y zip libgmp10:i386 libmpc3:i386

ADD run-tt /sbin/run-tt

ENTRYPOINT ["/sbin/run-tt"]
CMD ["bin/bash""]

