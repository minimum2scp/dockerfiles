FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ADD scripts /build/scripts
RUN run-parts --report /build/scripts && rm -rf /build

EXPOSE 19292
WORKDIR /home/debian/diary
USER debian
CMD ["bundle", "exec", "tdiary", "server"]

