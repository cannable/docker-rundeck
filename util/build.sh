#!/bin/bash


# ------------------------------------------------------------------------------
# Buildah Build Script
# ------------------------------------------------------------------------------

IMAGE="cannable/rundeck"
ARCHES=(amd64 arm64)


### Command-line Argument Handling
if [[ $# -ne 1 ]]; then
    echo Build container images
    echo build.sh rundeck_version
    exit 1
fi

version=$1


### Build architecture-specific images
for arch in ${ARCHES[@]}; do
    buildah bud \
        --arch "$arch" \
        --tag "${IMAGE}:${arch}-${version}" \
        -f ./Dockerfile .
done
