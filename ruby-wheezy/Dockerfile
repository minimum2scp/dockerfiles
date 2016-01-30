FROM minimum2scp/baseimage-wheezy:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/ruby-wheezy
RUN run-parts --report --exit-on-error /tmp/build/ruby-wheezy/scripts && rm -rfv /tmp/build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

