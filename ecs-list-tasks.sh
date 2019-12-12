#!/bin/sh
#
# Lists tasks running in an ECS service.
#
# See: https://docs.aws.amazon.com/cli/latest/reference/ecs/list-tasks.html
#

if [ $# -lt 1 ]
then
    echo "Usage: ecs-list-tasks.sh <env>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

aws ecs list-tasks \
    --region $AWS_REGION \
    --cluster $ECS_CLUSTER \
    --service-name $ECS_SERVICE
