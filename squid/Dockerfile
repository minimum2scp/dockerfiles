FROM minimum2scp/baseimage:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/squid
RUN run-parts --report --exit-on-error /tmp/build/squid/scripts && rm -rfv /tmp/build
EXPOSE 22 3128

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

