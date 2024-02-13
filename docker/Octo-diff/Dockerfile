# https://hub.docker.com/r/puppet/puppet-dev-tools
# FROM puppet/puppet-dev-tools:4.x
FROM ruby:2.7.8-bullseye

USER root
WORKDIR /root

COPY Gemfile /root/Gemfile
RUN apt update
RUN apt install -y make gcc cmake
RUN bundle config set --global path '/usr/local/bundle/gems/'
RUN bundle config set --global system 'true' && bundle config set jobs 3  && bundle update 
RUN bundle install
WORKDIR /
RUN git clone https://github.com/benjamin-robertson/onceover-octocatalog-diff.git
WORKDIR /onceover-octocatalog-diff
RUN git checkout remotes/origin/feature_prep_pr
RUN gem build onceover-octocatalog-diff.gemspec
RUN gem install onceover-octocatalog-diff-0.1.10.gem
RUN mkdir /repo
RUN rm -rf /usr/local/bundle/gems/puppet-7.*.0/spec
WORKDIR /repo
USER root