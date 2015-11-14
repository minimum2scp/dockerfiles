FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rfv /build
EXPOSE 22

USER debian
ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/bin/bash"]

