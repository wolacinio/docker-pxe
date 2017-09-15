#!/bin/bash
set -e
/etc/init.d/tftpd-hpa start
/etc/init.d/isc-dhcp-server start
/etc/init.d/smbd start
/etc/init.d/nmbd start