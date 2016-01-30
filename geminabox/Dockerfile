FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/geminabox
RUN run-parts --report --exit-on-error /tmp/build/geminabox/scripts && rm -rfv /tmp/build/geminabox
EXPOSE 22 80 9001

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

