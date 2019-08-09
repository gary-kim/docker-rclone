FROM alpine:3.10
LABEL maintainer="Gary Kim <gary@garykim.dev>"
WORKDIR /usr/bin
COPY rclone-src/rclone .
COPY docker-entrypoint.sh /
RUN apk add --no-cache ca-certificates
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
