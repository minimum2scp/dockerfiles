FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 80
EXPOSE 9200

CMD ["/sbin/init"]

