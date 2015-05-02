FROM minimum2scp/baseimage-wheezy:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rf /build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

