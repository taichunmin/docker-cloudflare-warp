#!/bin/sh

if [ -n "$WRAP_HOSTNAME" -a -n "$WRAP_URL" ] ; then
  if [ ! -r /root/.cloudflare-warp/cert.pem ] ; then
    cloudflare-warp login
  fi
  cloudflare-warp --hostname $WRAP_HOSTNAME $WRAP_URL
else
  echo "you need to assign 'WRAP_HOSTNAME' and 'WRAP_URL' in environment."
fi
