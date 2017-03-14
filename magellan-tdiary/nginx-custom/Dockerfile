FROM nginx:1.9
MAINTAINER YAMADA Tsuyoshi <tyamada@minimum2scp.org>

ADD https://get.docker.io/builds/Linux/x86_64/docker-latest              /usr/bin/docker
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64   /usr/local/bin/jq

RUN chmod +x /usr/bin/docker /usr/local/bin/jq

