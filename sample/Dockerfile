FROM rvm-on-alpine:latest

MAINTAINER Ayoub Khobalatte "ayoub.khobalatte@gmail.com"

ARG BUNDLER_VERSION
ARG RUBYGEMS_VERSION
ARG RUBY_VERSION
ARG RUBY_GEMSET
ARG PASSENGER_APP_ENV

# Install this project's RVM version
RUN "rvm list"
RUN /bin/bash --login "rvm list \
   && rvm install $RUBY_VERSION \
   && rvm gemset create $RUBY_GEMSET \
   && rvm use $RUBY_VERSION@$RUBY_GEMSET \
   && rvm install gem -v $RUBYGEMS_VERSION \
   && gem install bundler -v $BUNDLER_VERSION"

# Install Passenger & Nginx
RUN /bin/bash --login "gem install passenger \
	&& passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx"

WORKDIR /usr/src/app
EXPOSE 3000

ENTRYPOINT ["passenger", "start", "--no-install-runtime", "--no-compile-runtime"]

