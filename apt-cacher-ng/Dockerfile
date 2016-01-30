FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/apt-cacher-ng
RUN run-parts --report --exit-on-error /tmp/build/apt-cacher-ng/scripts && rm -rfv /tmp/build/apt-cacher-ng
EXPOSE 3142

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

