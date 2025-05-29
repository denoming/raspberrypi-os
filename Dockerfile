ARG BASE=python:3.11-bookworm
FROM $BASE
ARG TARGETARCH

COPY image/ /

# Add RaspberryPi specific packages upstream
RUN dpkg --add-architecture $TARGETARCH \
 && echo "deb http://archive.raspberrypi.org/debian/ $(sh -c '. /etc/os-release; echo $VERSION_CODENAME') main" > /etc/apt/sources.list.d/raspi.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libraspberrypi0 \
    libraspberrypi-bin \
 && rm -rf /var/lib/apt/lists/*

# Save current architecture into file
RUN python -c 'import os;print(f"Arch: {os.uname().machine}")' > /tmp/arch.txt
