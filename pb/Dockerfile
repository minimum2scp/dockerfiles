FROM minimum2scp/debian:latest
MAINTAINER YAMADA Tsuyoshi tyamada@minimum2scp.org

ENV DEBIAN_FRONTEND noninteractive
ADD build /build
RUN run-parts --report /build/scripts && rm -rf /build

CMD /bin/bash
