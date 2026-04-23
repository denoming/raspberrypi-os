#!/usr/bin/env bash

set -e

ROOT=$(dirname "$(realpath -s $0)")

bash ${ROOT}/build-image.sh "python:3.11-trixie" "linux/arm64/v8"
bash ${ROOT}/build-image.sh "python:3.12-trixie" "linux/arm64/v8"
