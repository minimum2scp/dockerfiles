FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 3142

CMD ["/sbin/init"]

