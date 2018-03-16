FROM alpine:3.7
LABEL maintainer="taichunmin@gmail.com"
ENV WARP_URL="https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-arm.tgz"

COPY docker-cmd.sh /usr/local/bin/docker-cmd

RUN set -ex; \
  apk add --no-cache ca-certificates; \
  apk add --no-cache --virtual .fetch-deps curl tar; \
  if ! curl -fL -o warp.tgz "$WARP_URL"; then \
    echo >&2 "error: failed to download '$WARP_URL'"; \
    exit 1; \
  fi; \
  tar --extract \
    --file warp.tgz \
    --directory /usr/local/bin/ \
  ; \
  rm warp.tgz; \
  apk del .fetch-deps; \
  chmod +x /usr/local/bin/docker-cmd

CMD ["docker-cmd"]
