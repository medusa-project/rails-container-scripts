#!/bin/sh

source rails-container-scripts/env.sh

docker build -f rails-container-scripts/Dockerfile \
    -t $APP_NAME .
