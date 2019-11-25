#!/bin/sh

if [ $# -lt 1 ]
then
    echo "Usage: redeploy.sh <env>"
    exit 1
fi

rails-container-scripts/docker-build.sh $1
if [ $? -ne 0 ]
    echo "Failed to build the image"
    exit 1
fi

rails-container-scripts/ecr-push.sh $1
if [ $? -ne 0 ]
    echo "Failed to push the image to ECR"
    exit 1
fi

rails-container-scripts/ecs-deploy-webapp.sh $1
