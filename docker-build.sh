#!/bin/sh

source docker/env.sh

docker build -f docker/Dockerfile \
    -t $APP_NAME .
