# distil-build

Generates the Docker image used to build Distil on CircleCI:

* https://circleci.com/gh/uncharted-distil/distil

## Dependencies

- [Docker](http://www.docker.com/) platform.

## Building and Deploying the Image

1. Update the version number in `./config.sh`
1. Run `./docker_build.sh` to build the image.
1. Run `docker_push.sh` to push the image to the docker repository.

CircleCI is configured to pick up the `latest` tag so the updates should be applied on any subsequent builds.
