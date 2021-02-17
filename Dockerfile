FROM archlinux:latest
RUN mkdir -p /var/cache/pacman/pkg
RUN mkdir -p /var/lib/pacman
RUN mkdir -p /var/log
RUN pacman -Syyu

ENV ROON_DATAROOT /var/roon
ENV ROON_ID_DIR /var/roon

RUN install_packages bzip2 wget ffmpeg cifs-utils
RUN wget -q --no-check-certificate -O- https://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2 \
    | tar xjf - -C /opt

VOLUME [$ROON_DATAROOT, "/music", "/backups"]

RUN /opt/RoonServer/check.sh
ENTRYPOINT /opt/RoonServer/start.sh