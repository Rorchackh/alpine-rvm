FROM alpine:3.7

MAINTAINER Ayoub Khobalatte "ayoub.khobalatte@gmail.com"

RUN apk update \

    # Installing Dependencies
    && apk add --no-cache bash g++ cmake make gcc gnupg curl procps zlib libssl1.0 linux-headers git tar \
    && rm -rf /var/cache/apk/* \

    # Install RVM
    && curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz \
    && echo 'export rvm_prefix="$HOME"' > /root/.rvmrc \
    && echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc \
    && mkdir rvm && cd rvm \
    && tar --strip-components=1 -xzf ../rvm-stable.tar.gz \
    && ./install --auto-dotfiles --autolibs=0 \
    && cd ../ && rm -rf rvm-stable stable.tar.gz rvm \
    && rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
