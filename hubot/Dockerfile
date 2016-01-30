FROM minimum2scp/nodejs:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /tmp/build/hubot
RUN run-parts --report --exit-on-error /tmp/build/hubot/scripts && rm -rfv /tmp/build/hubot
EXPOSE 22 8080

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

