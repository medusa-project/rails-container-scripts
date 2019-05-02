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

Then, in the `rails-container-scripts` directory, copy `env.list.sample` to
`env.list` and edit as necessary.

Finally, the scripts can be run from the parent (application root)
directory, which is expected to contain a `Dockerfile`.
