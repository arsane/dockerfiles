FROM kurron/docker-jetbrains-base:latest

MAINTAINER Sam Liao <phyomh@gmail.org>

LABEL org.kurron.ide.name="RubyMine" org.kurron.ide.version=2018.1

ADD https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh /tmp/install-font-ubuntu.sh

RUN bash /tmp/install-font-ubuntu.sh http://jorrel.googlepages.com/Monaco_Linux.ttf

ADD https://download.jetbrains.com/ruby/RubyMine-2018.1.2.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    mkdir -p /space && \
    rm /tmp/ide.tar.gz


ENV RUBYMINE_JDK=/usr/lib/jvm/oracle-jdk-8

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/bin/rubymine.sh"]
