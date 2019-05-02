#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage: docker-run-task.sh <rake task>"
    exit 1
fi

source docker/env.sh

docker run \
    --env-file env.list \
    --entrypoint=bin/rails \
    $APP_NAME $1
