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

RUN apt-get dist-upgrade -y && apt-get -y autoremove && apt-get -y autoclean

ADD run-tt /sbin/run-tt

ENTRYPOINT ["/sbin/run-tt"]
CMD ["bin/bash""]

