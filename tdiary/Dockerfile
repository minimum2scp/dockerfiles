FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rf /build
EXPOSE 22 80 9001

CMD ["/opt/init-wrapper/sbin/init"]

