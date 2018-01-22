FROM ubuntu:16.04
LABEL maintainer="taichunmin@gmail.com"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=C.UTF-8 DEBIAN_FRONTEND=noninteractive

WORKDIR /bin

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates

ADD https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-arm.tgz /bin
RUN tar zxf /bin/warp-stable-linux-arm.tgz && \
  rm /bin/warp-stable-linux-arm.tgz

COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/start.sh"]
