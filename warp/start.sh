#!/bin/bash

if [ -n "$CLOUDFLARE_HOSTNAME" -a -n "$URL" ] ; then
  if [ ! -r /root/.cloudflare-warp/cert.pem ] ; then
    /bin/cloudflare-warp login
  fi
  /bin/cloudflare-warp --hostname $CLOUDFLARE_HOSTNAME $URL
else
  echo "你需要在 .env 中指定 WARP_DOMAIN 和 WARP_URL，並且使用 docker-compose logs warp 來取得登入網址（第一次）。"
fi
