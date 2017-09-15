#!/bin/bash

set -e

echo -ne "TFTP_USERNAME=\"tftp\"
TFTP_DIRECTORY=\"/var/pxe\"
TFTP_ADDRESS=\":69\"
TFTP_OPTIONS=\"--secure\"
" > /etc/default/tftpd-hpa