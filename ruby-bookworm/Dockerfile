FROM minimum2scp/baseimage-bookworm:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/ruby-bookworm
RUN run-parts --report --exit-on-error /tmp/build/ruby-bookworm/scripts && rm -rfv /tmp/build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

