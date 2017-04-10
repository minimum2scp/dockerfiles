FROM ruby:2.4.1

COPY Gemfile Gemfile.lock Rakefile .rspec /usr/src/app/
COPY spec                                 /usr/src/app/spec/

WORKDIR /usr/src/app
RUN bundle install --path=vendor/bundle --jobs=4

