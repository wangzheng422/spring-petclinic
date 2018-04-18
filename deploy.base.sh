#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build --force-rm -f docker/base.Dockerfile -t spring-petclinic:base ./
docker tag spring-petclinic:base ${REGISTRY}/spring-petclinic:base


