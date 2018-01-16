FROM alpine:3.7

MAINTAINER Ayoub Khobalatte "ayoub.khobalatte@gmail.com"

ARG BUNDLER_VERSION
ARG RUBYGEMS_VERSION
ARG RUBY_VERSION
ARG RUBY_GEMSET
ARG PASSENGER_APP_ENV

RUN apk update \

    # Installing Dependencies
    && apk add nginx g++ cmake make gcc gnupg curl curl-dev procps zlib zlib-dev openssl openssl-dev libssl1.0 linux-headers git tar \
    && apk add --update bash && rm -rf /var/cache/apk/* \

    # Install RVM
    && curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz \
    && echo 'export rvm_prefix="$HOME"' > /root/.rvmrc \
    && echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc \
    && mkdir rvm && cd rvm \
    && tar --strip-components=1 -xzf ../rvm-stable.tar.gz \
    && ./install --auto-dotfiles --autolibs=0 \
    && cd ../ && rm -rf rvm-stable stable.tar.gz rvm \
    && rm -rf /var/cache/apk/*

    # Install ruby, bundler and gem
    && rvm install $RUBY_VERSION \
    && rvm gemset create $RUBY_GEMSET

ENTRYPOINT ["/bin/bash"]


