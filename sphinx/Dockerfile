FROM minimum2scp/debian:latest
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ENV DEBIAN_FRONTEND noninteractive

ADD scripts /build/scripts
RUN run-parts --report /build/scripts && rm -rf /build

CMD ["/bin/bash"]

