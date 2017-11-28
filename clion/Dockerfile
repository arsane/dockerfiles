FROM kurron/docker-azul-jdk-8-build:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

ENV CL_JDK /usr/lib/jvm/zulu-8-amd64


USER root

# Install make and compilers
RUN apt-get update && \
    apt-get install -y build-essential autoconf automake && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD https://download.jetbrains.com/cpp/CLion-2017.2.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    mkdir -p /space && \
    rm /tmp/ide.tar.gz && \
    rm -rf /opt/ide/jre64

USER developer:developer
WORKDIR /home/developer

ENTRYPOINT ["/opt/ide/bin/clion.sh"]

