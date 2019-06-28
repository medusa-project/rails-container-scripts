#!/bin/sh

if [ $# -lt 1 ]
then
    echo "Usage: docker-build.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

docker build -f Dockerfile -t $IMAGE_NAME .
