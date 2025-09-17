ARG BASE_CONTAINER=python:3.12-bookworm
FROM $BASE_CONTAINER
ARG TARGETARCH

COPY image/ /

# Add RaspberryPi specific packages upstream
RUN dpkg --add-architecture $TARGETARCH \
 && echo "deb http://archive.raspberrypi.org/debian/ $(sh -c '. /etc/os-release; echo $VERSION_CODENAME') main" > /etc/apt/sources.list.d/raspi.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/*

# Save current architecture into file
RUN python -c 'import os;print(f"Arch: {os.uname().machine}")' > /tmp/arch.txt
