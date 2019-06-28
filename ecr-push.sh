#!/bin/sh
#
# Builds a Docker image and pushes it to AWS ECR.
#

if [ $# -lt 1 ]
then
    echo "Usage: ecr-push.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

eval $(aws ecr get-login --no-include-email --region $AWS_REGION --profile $AWS_PROFILE)
docker tag $DOCKER_TAG $ECR_HOST/$DOCKER_TAG
docker push $ECR_HOST/$DOCKER_TAG
