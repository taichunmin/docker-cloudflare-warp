[![GitHub stars](https://img.shields.io/github/stars/taichunmin/docker-cloudflare-warp.svg)](https://github.com/taichunmin/docker-cloudflare-warp/stargazers)
[![GitHub license](https://img.shields.io/github/license/taichunmin/docker-cloudflare-warp.svg)](https://github.com/taichunmin/docker-cloudflare-warp/blob/master/LICENSE)
![Docker Stars](https://img.shields.io/docker/stars/taichunmin/cloudflare-warp.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/taichunmin/cloudflare-warp.svg)
![Docker Automated build](https://img.shields.io/docker/automated/taichunmin/cloudflare-warp.svg)
![Docker Build Status](https://img.shields.io/docker/build/taichunmin/cloudflare-warp.svg)

# docker-cloudflare-warp

Docker image for Cloudflare Warp. In favor of alpine, the docker image size is only 22 MB.

## Usage

1. Write a `docker-compose.yml` file.
  ```yml
  version: '2'

  services:
    warp:
      image: taichunmin/cloudflare-warp:latest
      volumes:
        - ./cloudflare-warp:/root/.cloudflare-warp
      environment:
        - WRAP_HOSTNAME=your.domain.com
        - WRAP_URL=http://127.0.0.1
  ```
2. use `docker-compose up -d` to start container.
  ```shell
  Creating minioasis_warp_1    ... done
  ```
3. you need to use `docker-compose logs warp` to login to cloudflare warp once.
  ```shell
  Attaching to docker_warp_1
  warp_1             | Please open the following URL and log in with your Cloudflare account:
  warp_1             |
  warp_1             | https://www.cloudflare.com/a/warp?callback=https%3A%2F%2Flogin.cloudflarewarp.com%2FXXXXXXXXXXXX
  warp_1             |
  warp_1             | Leave cloudflare-warp running to install the certificate automatically.
  ```

## DEMO

```shell
$ git clone git@github.com:taichunmin/docker-cloudflare-warp.git

$ cp .env.example .env

$ nano .env

# edit WRAP_HOSTNAME=your.domain.com

$ sudo docker-compose up -d

Creating network "dockercloudflarewarp_default" with the default driver
Creating dockercloudflarewarp_nginx_1 ... done
Creating dockercloudflarewarp_warp_1  ... done

$ sudo docker-compose logs -f warp

Attaching to dockercloudflarewarp_warp_1
warp_1   | Please open the following URL and log in with your Cloudflare account:
warp_1   |
warp_1   | https://www.cloudflare.com/a/warp?callback=https%3A%2F%2Flogin.cloudflarewarp.com%2FXXXXXXXXXXXX
warp_1   |
warp_1   | Leave cloudflare-warp running to install the certificate automatically.
warp_1   | You have successfully logged in.
warp_1   | If you wish to copy your credentials to a server, they have been saved to:
warp_1   | /root/.cloudflare-warp/cert.pem
warp_1   | time="2018-01-22T03:35:32Z" level=info msg="Proxying tunnel requests to http://nginx"
warp_1   | time="2018-01-22T03:35:32Z" level=info msg="Autoupdate frequency is set to 24h0m0s"
warp_1   | time="2018-01-22T03:35:32Z" level=info msg="Starting metrics server" addr=127.0.0.1:33915
warp_1   | time="2018-01-22T03:35:34Z" level=info msg="Connected to NRT"
warp_1   | time="2018-01-22T03:35:34Z" level=info msg="There are currently 1 active tunnels for this zone. Your quota is 10" subsystem=rpc
warp_1   | time="2018-01-22T03:35:34Z" level=info msg="Registered at https://your.domain.com"
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="Connected to NRT"
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="There are currently 1 active tunnels for this zone. Your quota is 10" subsystem=rpc
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="Registered at https://your.domain.com"
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="Connected to SIN"
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="There are currently 1 active tunnels for this zone. Your quota is 10" subsystem=rpc
warp_1   | time="2018-01-22T03:35:37Z" level=info msg="Registered at https://your.domain.com"
warp_1   | time="2018-01-22T03:35:38Z" level=info msg="Connected to SIN"
warp_1   | time="2018-01-22T03:35:38Z" level=info msg="There are currently 1 active tunnels for this zone. Your quota is 10" subsystem=rpc
warp_1   | time="2018-01-22T03:35:38Z" level=info msg="Registered at https://your.domain.com"
```

## LICENSE

MIT License