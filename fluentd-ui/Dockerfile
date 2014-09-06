FROM minimum2scp/ruby:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ADD build /build
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 22 9001 9292

CMD ["/sbin/init"]

