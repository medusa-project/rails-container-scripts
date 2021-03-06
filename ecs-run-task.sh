#!/bin/sh
#
# Runs a one-off rake command as an ECS task using the aws command-line tool.
#
# See: https://docs.aws.amazon.com/cli/latest/reference/ecs/run-task.html
#

if [ $# -lt 2 ]
then
    echo "Usage: ecs-run-task.sh <env> <rake task>"
    exit 1
fi

source rails-container-scripts/env.sh env-common.list
source rails-container-scripts/env.sh env-$1.list

aws ecs run-task \
    --launch-type FARGATE \
    --profile $AWS_PROFILE \
    --region $AWS_REGION \
    --cluster $ECS_CLUSTER \
    --count 1 \
    --task-definition $ECS_CONSOLE_TASK_DEFINITION \
    --network-configuration "awsvpcConfiguration={subnets=[$ECS_SUBNET],securityGroups=[$ECS_SECURITY_GROUP],assignPublicIp=ENABLED}" \
    --overrides "{ \"containerOverrides\": [ { \"name\": \"$IMAGE_NAME\", \"command\": [ \"bin/rails\", \"$2\" ] } ] }"
