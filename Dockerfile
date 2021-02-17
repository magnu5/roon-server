FROM ubuntu:latest

RUN apt update && apt install libasound2 alsa-lib ffmpeg cifs-utils ffmpeg bzip2 wget

ENV ROON_DATAROOT /var/roon
ENV ROON_ID_DIR /var/roon
ADD roonserver.service /usr/lib/systemd/system/roonserver.service

RUN wget -q --no-check-certificate -O- https://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2 \
 	| tar xjf - -C /opt

VOLUME [$ROON_DATAROOT, "/music", "/backups"]

RUN /opt/RoonServer/check.sh
ENTRYPOINT /opt/RoonServer/start.sh