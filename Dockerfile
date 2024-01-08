FROM linuxserver/webtop:ubuntu-xfce

RUN apt update
COPY xrdp-installer-1.4.8.sh xrdp-installer-1.4.8.sh

RUN ./xrdp-installer-1.4.8.sh -s

RUN echo "abc:pass" | chpasswd
COPY startwm.sh /defaults/startwm.sh
