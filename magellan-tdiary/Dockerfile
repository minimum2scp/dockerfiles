FROM ruby:2.2.3
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

## install magellan-proxy
RUN curl -L -o /usr/local/bin/magellan-proxy https://github.com/groovenauts/magellan-proxy/releases/download/v0.0.1/magellan-proxy_linux-amd64 && \
    chmod +x /usr/local/bin/magellan-proxy

## install tdiary-core
RUN git clone https://github.com/tdiary/tdiary-core.git /usr/src/app
RUN cd /usr/src/app && bundle install --jobs=4 --without=development:test

## customize tdiary
ADD build /build
RUN cp -a /build/Gemfile.local /usr/src/app/ && cd /usr/src/app && bundle install
RUN cp -a /build/tdiary.conf /usr/src/app/

## install entrypoint script
RUN install -m 755 -o root -g root -p -D /build/entrypoint /opt/magellan-tdiary/entrypoint
RUN install -m 644 -o root -g root -p -D /build/Rakefile   /opt/magellan-tdiary/Rakefile

RUN rm -rf /build

WORKDIR /usr/src/app
VOLUME /usr/src/app/data
ENTRYPOINT ["/opt/magellan-tdiary/entrypoint"]
CMD ["/usr/local/bin/magellan-proxy", "bundle", "exec", "puma", "-p", "80", "-e", "production"]

