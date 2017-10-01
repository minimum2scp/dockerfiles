FROM minimum2scp/baseimage:latest
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/sphinx
RUN run-parts --report --exit-on-error /tmp/build/sphinx/scripts && rm -rfv /tmp/build
EXPOSE 22

USER debian
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/bin/bash"]

