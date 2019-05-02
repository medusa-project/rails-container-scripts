#!/bin/sh
#
# Runs the web app locally.

source rails-container-scripts/env.sh

docker run -p $CONTAINER_PORT:$CONTAINER_PORT -it \
    --env-file rails-container-scripts/env.list \
    $APP_NAME
