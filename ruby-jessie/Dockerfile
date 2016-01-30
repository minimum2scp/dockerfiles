FROM minimum2scp/baseimage-jessie:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/ruby-jessie
RUN run-parts --report --exit-on-error /tmp/build/ruby-jessie/scripts && rm -rfv /tmp/build/ruby-jessie
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

