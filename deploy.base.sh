#!/usr/bin/env bash

set -e
set -x

source config.sh

docker build -f docker/mysql.Dockerfile -t spring-petclinic:mysql ./
docker tag spring-petclinic:mysql ${REGISTRY}/spring-petclinic:mysql

docker build -f docker/base.Dockerfile -t spring-petclinic:base ./
docker tag spring-petclinic:base ${REGISTRY}/spring-petclinic:base

