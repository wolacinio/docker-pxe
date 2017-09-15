#!/bin/bash

set -e

cp /usr/lib/PXELINUX/pxelinux.0 /var/pxe
mkdir /var/pxe/pxelinux.cfg

echo -ne "MENU TITLE PXEBOOT MENU
PROMPT 0
TIMEOUT 150

LABEL CLIENT
 MENU DEFAULT
 MENU LABEL Boot WinPE
 KERNEL memdisk
 INITRD winpe.iso
 APPEND iso raw

" > /var/pxe/pxelinux.cfg/default