FROM minimum2scp/debian:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ENV DEBIAN_FRONTEND noninteractive

ADD scripts /build/scripts
RUN run-parts --report /build/scripts && rm -rf /build
EXPOSE 3142

CMD ["/usr/sbin/apt-cacher-ng", "-c", "/etc/apt-cacher-ng", "pidfile=/var/run/apt-cacher-ng/pid", "SocketPath=/var/run/apt-cacher-ng/socket", "foreground=1"]

