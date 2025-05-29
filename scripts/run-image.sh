#!/usr/bin/env bash

set -e

BASE="${1:-python:3.11-bookworm}"
ARCH="${2:-arm64/v8}"
USER_NAME="${3:-$(whoami)}"

IMAGE_NAME="denoming/raspberrypi-os:${BASE//:}"
USER_UID="$(id ${USER_NAME} -u)"
USER_GID="$(id ${USER_NAME} -g)"

echo "=============================="
echo "    Image: ${IMAGE_NAME}"
echo "     Arch: ${ARCH}"
echo "     User: ${USER_NAME}"
echo "  User ID: ${USER_UID}"
echo " Group ID: ${USER_GID}"
echo "=============================="

run_image()
{
  RUN_CMD=(docker run -it \
  --platform "linux/${ARCH}" \
  --rm \
  --user "${USER_UID}:${USER_GID}" \
  --network "host" \
  "${IMAGE_NAME}" /bin/bash)

  "${RUN_CMD[@]}"
}

main()
{
	run_image
}

main
