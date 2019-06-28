#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Usage: docker-run-task.sh <env> <rake task>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

docker run \
    --env-file "rails-container-scripts/env-common.list" \
    --env-file "rails-container-scripts/env-$1.list" \
    --entrypoint=bin/rails \
    $IMAGE_NAME $2
