#!/bin/sh
#
# Tells the ECS service to force a new rolling deployment. This will cause
# it to spin up however many new tasks from the `latest`-tagged container,
# insert them into the task pool, and remove the old ones.
#

source rails-container-scripts/env.sh

aws ecs update-service \
    --profile $AWS_PROFILE \
    --region $AWS_REGION \
    --cluster $ECS_CLUSTER \
    --service $ECS_SERVICE \
    --desired-count $ECS_WEBAPP_TASK_COUNT \
    --force-new-deployment
