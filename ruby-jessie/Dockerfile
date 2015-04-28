FROM minimum2scp/baseimage-jessie:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rf /build
Expose 22

CMD ["/opt/init-wrapper/sbin/init"]

