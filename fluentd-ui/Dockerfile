FROM minimum2scp/ruby:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

ADD build /tmp/build/fluentd-ui
RUN run-parts --report --exit-on-error /tmp/build/fluentd-ui/scripts && rm -rfv /tmp/build
EXPOSE 22 80 9001

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

