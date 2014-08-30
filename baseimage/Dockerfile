FROM minimum2scp/debian:latest
MAINTAINER YAMADA Tsuyoshi tyamada@minimum2scp.org

COPY build /build
RUN run-parts --report /build/scripts && rm -rf /build

CMD ["/sbin/init"]
