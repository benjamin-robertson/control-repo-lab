# https://hub.docker.com/r/puppet/puppet-dev-tools
FROM puppet/puppet-dev-tools:4.x

WORKDIR /root

COPY Gemfile /root/Gemfile
RUN mkdir /root/.ssh
RUN ssh-keyscan -H github.com >> /root/.ssh/known_hosts
RUN bundle config set --local path '/usr/local/bundle/gems/'
RUN bundle install
