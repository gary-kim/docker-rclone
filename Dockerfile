FROM ubuntu:18.04 AS downloader
WORKDIR /save
RUN apt-get update && apt-get install -y curl unzip \
    && curl --output rclone.zip -L 'https://github.com/rclone/rclone/releases/download/v1.48.0/rclone-v1.48.0-linux-amd64.zip'\
    && unzip -q -d . rclone.zip\
    && mv rclone-v1.48.0-linux-amd64/rclone rclone

FROM alpine:3.10
LABEL maintainer="Gary Kim <gary@garykim.dev>"
WORKDIR /usr/bin
COPY --from=downloader /save/rclone .
RUN apk add --no-cache ca-certificates

