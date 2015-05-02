FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rf /build
EXPOSE 22 4001 7001

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

