[![Build Containers](https://github.com/denoming/raspberrypi-os/actions/workflows/build.yaml/badge.svg)](https://github.com/denoming/raspberrypi-os/actions/workflows/build.yaml)

<h1 align="center">
  Raspberry Pi OS Docker Base Images
</h1>

<p align="center">
  <a href="https://github.com/denoming/raspberrypi-os/">GitHub Repo</a> |
  <a href="https://hub.docker.com/r/denoming/raspberrypi-os">Docker Hub</a> |
  <a href="https://github.com/denoming/raspberrypi-os/pkgs/container/raspberrypi-os">
    GitHub Container Registry
  </a>
</p>

# Overview

Here are Docker container base images for building and running software that requires Raspberry Pi's Debian packageset.

# Usage

From your Dockerfile,
```Dockerfile
FROM denoming/raspberrypi-os:trixie
```

Or from the command line
```bash
$ docker run -it denoming/raspberrypi-os:trixie
```

# Containers

**Debian (Trixie)**
  * Base image: `debian:trixie`
  * Image names: `denoming/raspberrypi-os:latest`, `ghcr.io/denoming/raspberrypi-os:latest`
  * Tags: `latest`, `trixie`

**Python 3.13 (Debian Trixie)**
  * Base image: `python:3.13-trixie`
  * Image names: `denoming/raspberrypi-os:python`, `ghcr.io/denoming/raspberrypi-os:python`
  * Tags: `python`, `python-trixie`, `python3.13`, `python3.13-trixie`

**Python 3.12 (Debian Trixie)**
  * Base image: `python:3.12-trixie`
  * Image names: `denoming/raspberrypi-os:python`, `ghcr.io/denoming/raspberrypi-os:python`
  * Tags: `python3.12`, `python3.12-trixie`
