FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/rails4
RUN run-parts --report --exit-on-error /tmp/build/rails4/scripts && rm -rfv /tmp/build/rails4
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

