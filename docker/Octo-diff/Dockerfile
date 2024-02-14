# https://hub.docker.com/r/puppet/puppet-dev-tools
# FROM puppet/puppet-dev-tools:4.x
FROM ruby:2.7.8-bullseye

USER root
WORKDIR /root

COPY Gemfile /root/Gemfile
ENV LANG=C.UTF-8
ENV RUBY_MAJOR=2.7
WORKDIR /
RUN git clone https://github.com/benjamin-robertson/onceover-octocatalog-diff.git
WORKDIR /onceover-octocatalog-diff
RUN git checkout remotes/origin/feature_prep_pr
RUN gem build onceover-octocatalog-diff.gemspec
WORKDIR /root
ENV GEM_HOME="/usr/local/bundle"
ENV BUNDLE_SILENCE_ROOT_WARNING=1 BUNDLE_APP_CONFIG=/usr/local/bundle
ENV PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"
RUN apt update
RUN apt install -y make gcc cmake
# RUN ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
# RUN bundle config set --global path '/usr/local/bundle/gems/'
RUN bundle config set system 'true' && bundle config set jobs 3   && bundle install 
# WORKDIR /
# RUN git clone https://github.com/benjamin-robertson/onceover-octocatalog-diff.git
# WORKDIR /onceover-octocatalog-diff
# RUN git checkout remotes/origin/feature_prep_pr
# RUN gem build onceover-octocatalog-diff.gemspec
RUN gem install /onceover-octocatalog-diff/onceover-octocatalog-diff-0.1.10.gem
RUN mkdir /repo
RUN rm -rf /usr/local/bundle/gems/puppet-7.*.0/spec
WORKDIR /repo
USER root