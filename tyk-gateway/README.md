# Tyk gateway

#### Table of contents

1. [Overview](#overview)
2. [Technologies](#technologies)
3. [Authors](#authors)
4. [Contributors](#contributors)
5. [Compatibility](#compatibility)
6. [Requirements](#requirements)
7. [Setup and Tasting](#setup-and-tasting)

## Overview

Dockerize Tyk gateway application for tasting and findings on Docker Swarm cluster (docker-1.12+).

## Technologies

* Tyk gateway
* Docker-1.12.0~rc4+

## Authors

* Adriano Vieira (adriano.svieira at gmail.com)

## Contributors

* TBD

## Compatibility

Built on CEntOS-7 as base Docker image.

### Tags

- **standard and supported**:
  - **centos7** (***latest***): built based on centos:7 image

## Requirements

- Docker-1.12+ <https://docker.com>

## Setup and Tasting

First of all we need a host with Docker-1.12+ pre-installed and running. May be you could use one of my "Docker boxes" <https://atlas.hashicorp.com/adrianovieira/boxes> with built-in docker-1.12.

If you're familiar Docker with you could take it (e.g.: `docker pull adrianovieira/tyk-gateway`) and play around.

If not, let me know how I'd improve this ***doc*** or even you'd take a look at my other project <https://github.com/adrianovieira/docker-swarm>.

### Defining Forwarded Ports

```
config.vm.network "forwarded_port", guest: 80, host: 8080
config.vm.network "forwarded_port", guest: 5000, host: 5000
config.vm.network "forwarded_port", guest: 3000, host: 3000
config.vm.network "forwarded_port", guest: 9090, host: 9090
config.vm.network "forwarded_port", guest: 9393, host: 9393
config.vm.network "forwarded_port", guest: 7000, host: 7000
config.vm.network "forwarded_port", guest: 4440, host: 4440
```

### Proxy

If you are behind a proxy and is having problems pulling docker imagens... setup *Systemd Docker own Service*, as below (well done on CEntOS-7):

```bash
# setup docker service proxy (as root user)
mkdir -p /etc/systemd/system/docker.service.d
echo "[Service]" > /etc/systemd/system/docker.service.d/proxy.conf
echo "Environment='HTTPS_PROXY=$HTTP_PROXY' 'HTTP_PROXY=$HTTP_PROXY'" >> /etc/systemd/system/docker.service.d/proxy.conf
systemctl daemon-reload && systemctl restart docker
```

***keep CALMS and having fun***
