#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build -f docker/base.Dockerfile -t spring-petclinic:base ./
docker tag spring-petclinic:base ${REGISTRY}/spring-petclinic:base

docker build -f docker/build.Dockerfile -t ${REGISTRY}/spring-petclinic ./

docker push ${REGISTRY}/spring-petclinic
docker push ${REGISTRY}/spring-petclinic:mysql