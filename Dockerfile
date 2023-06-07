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

RUN apt-get  update

RUN apt-get --no-install-recommends install -y build-essential

RUN apt-get --no-install-recommends install -y bc gawk subversion
RUN ln -sf libreadline.so.7 /lib/i386-linux-gnu/libreadline.so.5 && \
    ln -sf libhistory.so.7 /lib/i386-linux-gnu/libhistory.so.5 && \
    useradd -d /homedir --uid 500 user500 && \
    useradd -d /homedir --uid 501 user501 && \
    useradd -d /homedir --uid 502 user502 && \
    useradd -d /homedir --uid 503 user503 && \
    useradd -d /homedir --uid 504 user504 && \
    useradd -d /homedir --uid 1001 user1001 && \
    useradd -d /homedir --uid 1002 user1002 && \
    useradd -d /homedir --uid 1003 user1003 && \
    useradd -d /homedir --uid 1004 user1004 && \
    true
RUN apt-get --no-install-recommends install -y zip libgmp10:i386 libmpc3:i386 libssl-dev:i386 gcc-multilib
RUN apt-get --no-install-recommends install -y file valgrind libc6-dbg:i386
RUN apt-get --no-install-recommends install -y lua5.2 liblua5.2-dev pkg-config socat
RUN apt-get --no-install-recommends install -y libreadline-dev:i386 libncurses-dev:i386 zlib1g-dev:i386
RUN apt-get --no-install-recommends install -y ccache git rsync
RUN ln -s libmpfr.so.6 /usr/lib/i386-linux-gnu/libmpfr.so.4 
RUN apt-get --no-install-recommends install -y libreadline-dev:i386 libncurses-dev:i386 zlib1g-dev:i386 zlib1g-dev
RUN apt-get --no-install-recommends install -y openssl:i386 libusb-dev:i386 bind9-host python3 libusb-1.0-0 python3-pip
RUN ln -sf python3 /usr/bin/python
RUN apt-get --no-install-recommends install -y tcl tclx8.4

ADD run-tt /sbin/run-tt

ENTRYPOINT ["/sbin/run-tt"]
CMD ["/bin/bash"]

