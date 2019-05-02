#!/bin/sh

rails-container-scripts/docker-build.sh
rails-container-scripts/ecr-push.sh
rails-container-scripts/ecs-deploy-webapp.sh
