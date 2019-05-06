FROM ruby:2.6.3-slim-stretch

RUN gem install bundler --version '~> 2.0'

COPY Gemfile Gemfile.lock Rakefile .rspec /usr/src/app/
COPY spec                                 /usr/src/app/spec/

WORKDIR /usr/src/app
RUN bundle install --path=vendor/bundle --jobs=4

