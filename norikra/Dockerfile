FROM minimum2scp/ruby:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/norikra
RUN run-parts --report --exit-on-error /tmp/build/norikra/scripts && rm -rfv /tmp/build
EXPOSE 22 9001 26571 26578

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

