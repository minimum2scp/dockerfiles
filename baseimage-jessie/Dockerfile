FROM minimum2scp/debian-jessie:latest
MAINTAINER YAMADA Tsuyoshi tyamada@minimum2scp.org

COPY build /tmp/build/baseimage-jessie
RUN run-parts --report --exit-on-error /tmp/build/baseimage-jessie/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

