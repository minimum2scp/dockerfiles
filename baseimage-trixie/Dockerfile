FROM minimum2scp/debian-trixie:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/baseimage-trixie
RUN run-parts --report --exit-on-error /tmp/build/baseimage-trixie/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

