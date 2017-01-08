FROM ruby:2.1
MAINTAINER yves.bonjour@gmail.com

RUN apt-get update && apt-get install mercurial -y

RUN bash -c "gem install bundler"

ADD . /build-notifications
RUN bash -c "(cd /build-notifications; bundle install)"
ENV PATH="/build-notifications/bin:${PATH}"

CMD bash -c "echo 'Build Notifications: Start server by running the command build-notifications'"