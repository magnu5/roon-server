FROM archlinux:base-devel
RUN pacman -Syu --noconfirm
RUN install_packages alsa-lib cifs-utils ffmpeg
ENV ROON_DATAROOT /var/roon
ENV ROON_ID_DIR /var/roon
RUN rm -rf /opt/RoonServer
RUN git clone https://aur.archlinux.org/roonserver.git && cd roonserver && makepkg -si

VOLUME [$ROON_DATAROOT, "/music", "/backups"]

RUN /opt/RoonServer/check.sh
ENTRYPOINT /opt/RoonServer/start.sh