FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

COPY build /build
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 26571 26578

CMD ["/sbin/init"]

