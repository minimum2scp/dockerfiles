FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ADD scripts /build/scripts
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 9292

CMD ["/sbin/init"]

