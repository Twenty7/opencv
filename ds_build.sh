#!/usr/bin/env bash

set -a; . ./.env; set +a


docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}" https://${DOCKER_REGISTRY}

docker buildx build --push --platform linux/arm64/v8,linux/amd64 --build-arg OPENCV_VERSION=${OPENCV_VERSION} --tag ${DOCKER_REGISTRY}/${DOCKER_USERNAME}/opencv:${OPENCV_VERSION}-ubuntu ./ubuntu/


