#!/bin/sh
#
# Runs the web app locally.

source docker/env.sh

docker run -p $CONTAINER_PORT:$CONTAINER_PORT -it \
    --env-file docker/env.list \
    $APP_NAME
