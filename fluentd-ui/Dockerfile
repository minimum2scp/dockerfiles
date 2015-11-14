FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ADD build /build
RUN run-parts --report --exit-on-error /build/scripts && rm -rfv /build
EXPOSE 22 80 9001

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

