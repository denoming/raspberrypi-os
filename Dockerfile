ARG BASE_CONTAINER=python:3.12-bookworm
FROM $BASE_CONTAINER
ARG TARGETARCH

LABEL org.opencontainers.image.source=https://github.com/denoming/raspberrypi-os
LABEL org.opencontainers.image.description="Raspberry Pi OS Docker Base Images"
LABEL org.opencontainers.image.licenses=MIT

COPY image/ /

# Add RaspberryPi specific packages upstream
RUN dpkg --add-architecture $TARGETARCH \
 && echo "deb http://archive.raspberrypi.org/debian/ $(sh -c '. /etc/os-release; echo $VERSION_CODENAME') main" > /etc/apt/sources.list.d/raspi.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/*
