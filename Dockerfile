# Base image
FROM ubuntu:latest

MAINTAINER Magnus Tuominen <magnus.tuominen@outlook.com>

# Copy install script
WORKDIR /opt/RoonServer
ADD roonserver-installer-linuxx64–docker.sh /opt/RoonServer

# Make install script executable and run it
RUN chmod +x roonserver-installer-linuxx64–docker.sh
RUN ./roonserver-installer-linuxx64–docker.sh

VOLUME [ "/var/RoonServer", "/music" ]
ENTRYPOINT /opt/RoonServer/start.sh