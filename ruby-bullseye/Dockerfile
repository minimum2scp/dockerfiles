FROM minimum2scp/baseimage-bullseye:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/ruby-bullseye
RUN run-parts --report --exit-on-error /tmp/build/ruby-bullseye/scripts && rm -rfv /tmp/build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

