FROM ubuntu:latest

RUN apt update && apt dist-upgrade -yqq
RUN apt install -yqq libasound2 ffmpeg cifs-utils ffmpeg bzip2 wget libicu66

ENV ROON_DATAROOT /var/roon
ENV ROON_ID_DIR /var/roon
COPY roonserver.service /usr/lib/systemd/system/roonserver.service

RUN wget -q --no-check-certificate -O- https://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2 \
 	| tar xjf - -C /opt

VOLUME [$ROON_DATAROOT, "/music", "/backups"]

RUN /opt/RoonServer/check.sh
ENTRYPOINT /opt/RoonServer/start.sh
