FROM rvm-on-alpine:latest

MAINTAINER Ayoub Khobalatte "ayoub.khobalatte@gmail.com"

ARG BUNDLER_VERSION
ARG RUBYGEMS_VERSION
ARG RUBY_VERSION
ARG RUBY_GEMSET
ARG PASSENGER_APP_ENV

# Install this project's RVM version
RUN rvm --list \ 
   && rvm install $RUBY_VERSION \
   && rvm gemset create $RUBY_GEMSET


# Install Passenger & Nginx
RUN echo "Not yet implemented"


# ENTRYPOINT ["/bin/bash"]


