FROM minimum2scp/baseimage-trixie:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/systemd-trixie
RUN run-parts --report --exit-on-error /tmp/build/systemd-trixie/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/usr/sbin/init"]

