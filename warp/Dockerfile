FROM alpine:3.7
LABEL maintainer="taichunmin@gmail.com"

RUN set -ex; \
  apk add --no-cache ca-certificates; \
  apk add --no-cache --virtual .fetch-deps curl tar; \
  if ! curl -fL -o warp.tgz https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-arm.tgz; then \
    echo >&2 "error: failed to download 'https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-arm.tgz'"; \
    exit 1; \
  fi; \
  tar --extract \
    --file warp.tgz \
    --directory /usr/local/bin/ \
  ; \
  rm warp.tgz; \
  apk del .fetch-deps

COPY docker-cmd.sh /usr/local/bin/docker-cmd
RUN chmod +x /usr/local/bin/docker-cmd

CMD ["docker-cmd"]
