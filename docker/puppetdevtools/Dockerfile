FROM docker.io/puppet/puppet-dev-tools:4.x

USER root
WORKDIR /root

RUN apt-get update -qq

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN wget https://apt.puppet.com/puppet-tools-release-buster.deb \
  && dpkg -i puppet-tools-release-buster.deb \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends pdk=3.3.0.0-1buster \
  && apt-get autoremove -y

WORKDIR /repo

USER root