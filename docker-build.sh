#!/bin/sh

source rails-container-scripts/env.sh

docker build -f Dockerfile -t $APP_NAME .
