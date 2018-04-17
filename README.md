# distil-build

Generates the Docker image used to build Distil projects on CircleCI:

* https://circleci.com/gh/unchartedsoftware/distil
* https://circleci.com/gh/unchartedsoftware/distil-ingest
* https://circleci.com/gh/unchartedsoftware/distil-pipeline-server

## Dependencies

- [Docker](http://www.docker.com/) platform.

## Building and Deploying the Image

1. Update the version number in `./docker_build.sh` and `./docker_push.sh`
1. Run `./docker_build.sh` to build the image.
1. Run `docker_push.sh` to push the image to the Uncharted Docker repository.

CircleCI is configured to pick up the `latest` tag so the updates should be applied on any subsequent builds.