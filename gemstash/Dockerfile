FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/gemstash
RUN run-parts --report --exit-on-error /tmp/build/gemstash/scripts && rm -rfv /tmp/build
EXPOSE 22 9292

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

