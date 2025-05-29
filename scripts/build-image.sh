#!/usr/bin/env bash

set -e

ROOT=$(dirname "$(dirname "$(realpath -s $0)")")

BASE="${1:-python:3.11-bookworm}"
PLATFORMS="${2:-linux/arm64/v8,linux/arm/v7}"

IMAGE_NAME="denoming/raspberrypi-os:${BASE//:}"

echo "===================================="
echo "  Platforms: ${PLATFORMS}"
echo "      Image: ${IMAGE_NAME}"
echo "===================================="

command -v docker > /dev/null
if [ $? != 0 ]; then
    echo -e "Error:"
    echo -e "Docker is not installed"
    exit 1
fi

build_image()
{
  BUILD_CMD=(docker buildx build \
  --platform "${PLATFORMS}" \
  --tag "${IMAGE_NAME}" \
  --push \
  --build-arg="BASE=${BASE}" \
  --file "${ROOT}/Dockerfile"
  "${ROOT}")

  echo -e "Building <${IMAGE_NAME}> image"
  echo "${BUILD_CMD[@]}"
  "${BUILD_CMD[@]}"
}

main()
{
	build_image	
}

main