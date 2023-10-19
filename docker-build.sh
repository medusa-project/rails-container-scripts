#!/bin/sh

if [ $# -lt 1 ]
then
    echo "Usage: docker-build.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

eval $(aws ecr get-login --no-include-email --region $AWS_REGION --profile $AWS_PROFILE)

docker buildx build --platform linux/arm64 --push \
    -t $ECR_HOST/$IMAGE_NAME .
