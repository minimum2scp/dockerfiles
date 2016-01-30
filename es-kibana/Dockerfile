FROM minimum2scp/baseimage:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/es-kibana
RUN run-parts --report --exit-on-error /tmp/build/es-kibana/scripts && rm -rfv /tmp/build/es-kibana
EXPOSE 22 5601 9200

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

