A collection of scripts for working with Docker and AWS ECR/ECS.

# Scripts

* docker-build.sh:      Builds an app image
* docker-run-task.sh:   Runs a one-off rake task locally in Docker
* docker-run-webapp.sh: Runs the web app locally in Docker

* ecr-push.sh:          Pushes the app image to ECR
* ecs-deploy-webapp.sh: Spins up a new web app task(s) based on the
                        `latest`-tagged app image in ECR
* ecs-run-task.sh:      Runs a one-off rake task in ECS
* redeploy.sh:          One-button build-push-deploy

# Usage

From your root application directory:

```
git submodule add https://github.com/medusa-project/rails-container-scripts
```

Then, in the `rails-container-scripts` directory, copy the sample variables
scripts into your own scripts:

```bash
# This contains variables common across environments.
cp env-common.list.sample env-common.list
# These contain environment-specific variables.
cp env-specific.list.sample env-demo.list
cp env-specific.list.sample env-prod.list
cp env-specific.list.sample env-whatever.list
```

Finally, the scripts can be run from the parent (application root)
directory, which is expected to contain a `Dockerfile`.

Most of them take an `environment` argument, which corresponds to one of the
files above. (`env-common.list` is always loaded first, then
`env-<env>.list`.)
