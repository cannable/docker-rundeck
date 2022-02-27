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


### Build architecture-specific images
for arch in ${ARCHES[@]}; do
    buildah bud \
        --arch "$arch" \
        --tag "${IMAGE}:${arch}-${version}" \
        --build-arg "UNIFI_VERSION=${version}" \
        --build-arg "UNIFI_PKG_PATH=${cachefile}" \
        -f ./Dockerfile .
done
