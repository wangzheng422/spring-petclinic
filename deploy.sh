#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build -f docker/build.Dockerfile -t ${REGISTRY}/spring-petclinic ./

docker push ${REGISTRY}/spring-petclinic
docker push ${REGISTRY}/spring-petclinic:mysql