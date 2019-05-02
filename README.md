A collection of scripts for working with Docker and AWS ECR/ECS.

# Scripts

* docker-build.sh:    Builds an image
* ecr-push.sh:        Pushes it to ECR
* ecs-deploy.sh:      Deploys the `latest`-tagged app image to ECS
* docker-run-task.sh: Runs a one-off rake task locally in Docker
* ecs-run-task.sh:    Runs a one-off rake task in ECS
* redeploy.sh:        One-button build-push-deploy

# Usage

From your root application directory:

```
git submodule add https://github.com/medusa-project/rails-container-scripts
```

Copy `env.list.sample` to `env.list` and edit as necessary.

Then, the scripts can be run from the parent (application root) directory.

The ones that access AWS use your default profile, which you can set up
manually by editing the `[default]` section of `~/.aws/credentials`, or,
preferably, using `aws login`.
