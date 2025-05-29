#!/usr/bin/env bash

set -e

ROOT=$(dirname "$(realpath -s $0)")

bash ${ROOT}/build-image.sh "python:3.11-bookworm" "linux/arm64/v8,linux/arm/v7"
bash ${ROOT}/build-image.sh "python:3.12-bookworm" "linux/arm64/v8,linux/arm/v7"
