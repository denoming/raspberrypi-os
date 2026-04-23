#!/usr/bin/env bash

set -e

base_container="${1:-python:3.12-trixie}"
platform="${2:-arm64}"

image="denoming/raspberrypi-os:${base_container//:}"

echo "===================================="
echo "      Image: ${image}"
echo "  Platforms: ${platforms}"
echo "===================================="

run_image()
{
  CMD=(docker run -it \
  --platform "linux/${platform}" \
  --rm \
  --network "host" \
  "${image}" /bin/bash)

  "${CMD[@]}"
}

main()
{
	run_image
}

main
