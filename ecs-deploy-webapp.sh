#!/bin/sh
#
# Tells the ECS service to force a new rolling deployment. This will cause
# it to spin up however many new tasks from the `latest`-tagged container,
# insert them into the task pool, and remove the old ones.
#

if [ $# -lt 1 ]
then
    echo "Usage: ecs-deploy-webapp.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

aws ecs update-service \
    --profile $AWS_PROFILE \
    --region $AWS_REGION \
    --cluster $ECS_CLUSTER \
    --service $ECS_SERVICE \
    --task-definition $ECS_WEBAPP_TASK_DEFINITION \
    --desired-count $ECS_WEBAPP_TASK_COUNT \
    --force-new-deployment
