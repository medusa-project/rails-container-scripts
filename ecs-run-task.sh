#!/bin/sh
#
# Runs a one-off rake command as an ECS task using the aws command-line tool.
#
# See: https://docs.aws.amazon.com/cli/latest/reference/ecs/run-task.html
#

source docker/env.sh

if [ -z "$1" ];
  then
    echo "Rake command is required. (bin/rails -T for a list)"
    exit
fi

aws ecs run-task \
    --launch-type FARGATE \
    --profile $AWS_PROFILE \
    --region $AWS_REGION \
    --cluster $ECS_CLUSTER \
    --task-definition $ECS_CONSOLE_TASK_DEFINITION \
    --network-configuration "awsvpcConfiguration={subnets=[$ECS_SUBNET],securityGroups=[$ECS_SECURITY_GROUP],assignPublicIp=ENABLED}" \
    --overrides "{ \"containerOverrides\": [ { \"name\": \"$APP_NAME\", \"command\": [ \"bin/rails\", \"'$1'\" ] } ] }"
