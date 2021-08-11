FROM minimum2scp/baseimage-bullseye:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/systemd-bullseye
RUN run-parts --report --exit-on-error /tmp/build/systemd-bullseye/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

