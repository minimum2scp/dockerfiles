FROM minimum2scp/debian-bullseye:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/baseimage-bullseye
RUN run-parts --report --exit-on-error /tmp/build/baseimage-bullseye/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

