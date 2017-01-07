FROM ruby:2.1
MAINTAINER yves.bonjour@gmail.com

ADD . /build-notifications
RUN bash -c "gem install bundler"
RUN bash -c "(cd /build-notifications; bundle install)"
