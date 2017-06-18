FROM minimum2scp/debian-stretch:latest
MAINTAINER YAMADA Tsuyoshi tyamada@minimum2scp.org

COPY build /tmp/build/baseimage-stretch
RUN run-parts --report --exit-on-error /tmp/build/baseimage-stretch/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

