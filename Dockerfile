FROM ubuntu:xenial

RUN apt update \
  && apt -y upgrade \
  && apt -y install \
    python2.7 \
    apt-transport-https \
    curl \
    make \
    gcc \
    g++ \
  && curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

COPY nodesource.list /etc/apt/sources.list.d/nodesource.list

RUN apt update \
  && apt -y install \
    nodejs \
  && apt-get clean \
  && npm install -g npm@latest-4 \
  && npm install --unsafe-perm -g \
    composer-cli \
    composer-playground

# Additional developent tools that are not dependent on above, so container builds can run facter 
RUN apt -y install \
    git \
    telnet

EXPOSE 8080

CMD ["/usr/bin/composer-playground"]
