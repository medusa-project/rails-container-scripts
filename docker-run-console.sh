#!/bin/sh

if [ $# -lt 1 ]
then
    echo "Usage: docker-run-console.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

docker run \
    --env-file "rails-container-scripts/env-common.list" \
    --env-file "rails-container-scripts/env-$1.list" \
    -it $IMAGE_NAME /bin/bash
