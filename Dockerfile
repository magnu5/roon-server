# Base image
FROM ubuntu:latest

MAINTAINER Magnus Tuominen <magnus.tuominen@outlook.com>

# Environment variables
ENV ROON_DATAROOT /var/RoonServer
ENV ROON_ID_DIR /var/RoonServer

# Install depends
RUN apt update -yqq && apt install -yqq curl ffmpeg cifs-utils

# Copy install script
WORKDIR /opt/RoonServer
ADD roonserver-installer-linuxx64–docker.sh /opt/RoonServer

# Make install script executable and run it
RUN chmod +x roonserver-installer-linuxx64–docker.sh && ./roonserver-installer-linuxx64–docker.sh

# Volumes
VOLUME [ "/var/RoonServer", "/music", "/backups" ]

# Do the thing
ENTRYPOINT /opt/RoonServer/start.sh