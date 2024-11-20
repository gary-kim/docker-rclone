FROM alpine:3.18
LABEL maintainer="Gary Kim <gary@garykim.dev>"
COPY rclone-src/rclone /usr/bin
COPY docker-entrypoint.sh /
RUN apk add --no-cache ca-certificates libc6-compat libstdc++ make fuse
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
