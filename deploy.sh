#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build --force-rm -f docker/mysql.Dockerfile -t spring-petclinic:mysql ./
docker tag spring-petclinic:mysql ${REGISTRY}/spring-petclinic:mysql

docker build --force-rm -f docker/build.Dockerfile -t ${REGISTRY}/spring-petclinic ./

docker push ${REGISTRY}/spring-petclinic:base
docker push ${REGISTRY}/spring-petclinic
docker push ${REGISTRY}/spring-petclinic:mysql