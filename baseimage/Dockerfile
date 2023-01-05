# syntax=docker/dockerfile:1
FROM minimum2scp/debian:latest AS baseimage
LABEL maintainer="YAMADA Tsuyoshi <tyamada@minimum2scp.org>"

COPY build /tmp/build/baseimage
RUN run-parts --report --exit-on-error /tmp/build/baseimage/scripts && rm -rfv /tmp/build

FROM baseimage AS nginx_builder
COPY build /tmp/build/baseimage
WORKDIR /var/tmp/nginx
RUN /tmp/build/baseimage/build_nginx

FROM baseimage
COPY --from=nginx_builder /var/tmp/nginx /var/tmp/nginx

EXPOSE 22
ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

