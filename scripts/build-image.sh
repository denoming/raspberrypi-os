#!/usr/bin/env bash

set -e

root_dir=$(dirname "$(dirname "$(realpath -s $0)")")

base_container="${1:-python:3.12-bookworm}"
platforms="${2:-linux/amd64,linux/arm64}"

image="denoming/raspberrypi-os:${base_container//:}"

echo "===================================="
echo "      Image: ${image}"
echo "  Platforms: ${platforms}"
echo "===================================="

command -v docker > /dev/null
if [ $? != 0 ]; then
    echo -e "Error:"
    echo -e "Docker is not installed"
    exit 1
fi

build_image()
{
  CMD=(docker buildx build \
  --platform "${platforms}" \
  --tag "${image}" \
  --push \
  --build-arg="BASE_CONTAINER=${base_container}" \
  --file "${root_dir}/Dockerfile" \
  "${root_dir}")

  echo -e "Building <${image}> image"
  echo "${CMD[@]}"
  "${CMD[@]}"
}

main()
{
	build_image	
}

main