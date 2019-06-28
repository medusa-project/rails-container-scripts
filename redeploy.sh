#!/bin/sh

if [ $# -lt 1 ]
then
    echo "Usage: redeploy.sh <env>"
    exit 1
fi

rails-container-scripts/docker-build.sh $1
rails-container-scripts/ecr-push.sh $1
rails-container-scripts/ecs-deploy-webapp.sh $1
