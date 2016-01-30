FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/sphinx
RUN run-parts --report --exit-on-error /tmp/build/sphinx/scripts && rm -rfv /tmp/build
EXPOSE 22

USER debian
ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/bin/bash"]

