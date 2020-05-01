# Base image
FROM ubuntu:focal

MAINTAINER Magnus Tuominen <magnus.tuominen@outlook.com>

# Install depends
RUN apt update -yqq && apt install -yqq tar curl ffmpeg cifs-utils

# Copy install script
WORKDIR /opt/RoonServer
ADD roonserver-installer-linuxx64–docker.sh /opt/RoonServer

# Make install script executable and run it
RUN chmod +x roonserver-installer-linuxx64–docker.sh
RUN ./roonserver-installer-linuxx64–docker.sh

VOLUME [ "/var/RoonServer", "/music", "/backups" ]
ENTRYPOINT /opt/RoonServer/start.sh