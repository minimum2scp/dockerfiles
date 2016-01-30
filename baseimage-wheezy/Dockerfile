FROM minimum2scp/debian-wheezy:latest
MAINTAINER YAMADA Tsuyoshi tyamada@minimum2scp.org

COPY build /tmp/build/baseimage-wheezy
RUN run-parts --report --exit-on-error /tmp/build/baseimage-wheezy/scripts && rm -rfv /tmp/build/baseimage-wheezy
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

