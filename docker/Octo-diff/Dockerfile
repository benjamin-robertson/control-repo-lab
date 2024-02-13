# https://hub.docker.com/r/puppet/puppet-dev-tools
# FROM puppet/puppet-dev-tools:4.x
FROM ruby:2.7.8-bullseye

# USER puppetdev
USER root
WORKDIR /root

COPY Gemfile /root/Gemfile
# RUN mkdir /root/.ssh
# RUN ssh-keyscan -H github.com >> /root/.ssh/known_hosts
# RUN rm -rf /usr/local/bundle/gems/*
# RUN gem uninstall onceover-codequality
# RUN gem uninstall puppet-lint-classes_and_types_beginning_with_digits-check
# RUN gem uninstall puppet-lint-leading_zero-check
# RUN gem uninstall puppet-lint-legacy_facts-check
# RUN gem uninstall puppet-lint-top_scope_facts-check
# RUN gem uninstall puppet-lint-trailing_comma-check
# RUN gem uninstall puppet-lint-unquoted_string-check
# RUN gem uninstall puppet-lint-version_comparison-check
# RUN gem uninstall puppet-lint --version 2.5.2 -I
# RUN VCS_REF=2308b03 GH_USER=puppetlabs /bin/sh -c bundle config set system 'true'   && bundle config set jobs 3   && bundle update   && rm -f /home/puppetdev/.bundle/config   && rm -rf /usr/local/bundle/gems/puppet-7.*.0/spec # buildkit
RUN apt update
RUN apt install -y make gcc cmake
RUN bundle config set system 'true' && bundle config set jobs 3  && bundle update 
RUN mkdir /repo
WORKDIR /repo
USER root