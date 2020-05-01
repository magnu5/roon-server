# Base image
FROM ubuntu:latest

MAINTAINER Magnus Tuominen <magnus.tuominen@outlook.com>

# Update base image
RUN apt -yqq update 
RUN apt -yqq dist-upgrade

# Grab install script from Roonlabs.com
ADD roonserver-installer-linuxx64-docker.sh /opt/RoonServer
WORKDIR /opt/RoonServer

# Make install script executable and run it
RUN chmod +x roonserver-installer-linuxx64-docker.sh
RUN ./roonserver-installer-linuxx64-docker.sh

VOLUME [ "/var/RoonServer", "/music" ]
ENTRYPOINT /opt/RoonServer/start.sh