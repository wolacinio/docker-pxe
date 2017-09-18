FROM scratch
ADD rootfs.tar.xz /
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ARG DEBIAN_FRONTEND=noninteractive
EXPOSE 445:445/tcp
EXPOSE 69:69/udp
EXPOSE 68:68/udp
EXPOSE 67:67/udp
ENV network=172.17.0.0
ENV mask=255.255.0.0
ENV ip=172.17.0.2
ENV range_from=172.17.0.1
ENV range_to=172.17.255.254
ENV broadcast=172.17.255.255
USER root:root
SHELL ["/bin/bash", "-c"]
WORKDIR /root
RUN apt-get update && apt-get install -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" systemd-sysv rsyslog net-tools iputils-ping
RUN apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" dist-upgrade
RUN apt-get install -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" isc-dhcp-server tftpd-hpa samba pxelinux
RUN apt-get -q -y autoremove && apt-get -q -y clean
ADD tftpd-hpa.sh .
ADD isc-dhcp-server.sh .
ADD run.sh .
ADD pxe.sh .
ADD samba.sh .
RUN mkdir -p /var/pxe
RUN mkdir -p /etc/dhcp
VOLUME /var/pxe
RUN . pxe.sh
RUN . tftpd-hpa.sh
RUN . isc-dhcp-server.sh
RUN . samba.sh
RUN echo -e ". run.sh\n. /root/.bashrc" >> /etc/bash.bashrc