FROM ruby:2.2.3
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

## install tdiary-core to /usr/src/app
RUN git clone https://github.com/tdiary/tdiary-core.git /usr/src/app
RUN cd /usr/src/app && bundle install --jobs=4 --without=development:test

## customize tdiary
ADD build /build
RUN cp -a /build/Gemfile.local /usr/src/app/ && \
    cd /usr/src/app && \
    bundle install
RUN cp -a /build/tdiary.conf /usr/src/app/

## install entrypoint script, and utility
RUN install -m 755 -o root -g root -p -D /build/entrypoint /opt/magellan-tdiary/entrypoint
RUN install -m 644 -o root -g root -p -D /build/Rakefile   /opt/magellan-tdiary/Rakefile

## install magellan-proxy
ADD https://github.com/groovenauts/magellan-proxy/releases/download/v0.0.2.pre/magellan-proxy-0.0.2.pre_linux-amd64 /usr/local/bin/magellan-proxy
RUN chmod +x /usr/local/bin/magellan-proxy

## cleanup
RUN rm -rf /build


ENV TDIARY_BASIC_AUTH_USERNAME tdiary
ENV TDIARY_BASIC_AUTH_PASSWORD tdiary

WORKDIR /usr/src/app

ENTRYPOINT ["/opt/magellan-tdiary/entrypoint"]
CMD ["/usr/local/bin/magellan-proxy", "bundle", "exec", "puma", "-p", "80", "-e", "production"]

