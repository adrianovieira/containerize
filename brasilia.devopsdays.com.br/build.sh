#!/bin/bash -x
# DevOpsDays Brasília
# author: Adriano dos Santos Vieira

# required to build
rm -rf build
mkdir -p build
if [[ $1 = 'prod' ]]; then
  #statements
  sed -e "s/#Ganalytics/Ganalytics/" -i config.toml
fi

# build for hugo server
docker-compose build brasilia.devopsdays.com.br.hugo

# generate website to build on apache httpd server
docker-compose run -d brasilia.devopsdays.com.br.hugo
docker exec $(docker-compose ps -q brasilia.devopsdays.com.br.hugo) hugo --baseUrl=http://brasilia.devopsdays.com.br --verbose -d /tmp/website

# build for apache httpd server
cp Dockerfile-httpd build
docker-compose build brasilia.devopsdays.com.br.httpd

# clean
CONTAINER_ID=$(docker-compose ps -q brasilia.devopsdays.com.br.hugo)
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
rm -rf build
git checkout config.toml
