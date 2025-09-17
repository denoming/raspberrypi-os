#!/usr/bin/env bash

set -e

base_container="${1:-python:3.12-bookworm}"
platform="${2:-arm64}"

image="denoming/raspberrypi-os:${base_container//:}"
user_uid="$(id -u)"
user_gid="$(id -g)"

echo "===================================="
echo "      Image: ${image}"
echo "  Platforms: ${platforms}"
echo "===================================="

run_image()
{
  CMD=(docker run -it \
  --platform "linux/${platform}" \
  --rm \
  --user "${user_uid}:${user_gid}" \
  --network "host" \
  "${image}" /bin/bash)

  "${CMD[@]}"
}

main()
{
	run_image
}

main
