#!/bin/sh

docker/docker-build.sh
docker/ecr-push.sh
docker/ecs-deploy-webapp.sh
