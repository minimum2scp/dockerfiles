FROM ruby:2.4.1

COPY Gemfile Gemfile.lock Rakefile .rspec /usr/src/app/
COPY spec                                 /usr/src/app/spec/

WORKDIR /usr/src/app
RUN bundle install --path=vendor/bundle --jobs=4

ARG DOCKER_VER=17.03.1-ce
RUN curl -L -o /tmp/docker-${DOCKER_VER}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VER}.tgz && \
    tar -xz -C /tmp -f /tmp/docker-${DOCKER_VER}.tgz && \
    mv /tmp/docker/* /usr/bin && \
    rm /tmp/docker-${DOCKER_VER}.tgz

