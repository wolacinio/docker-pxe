#!/bin/bash

set -e

mkdir /mnt/samba

echo -ne "
[global]
   netbios name = PXE
   workgroup = WORK
   server string = SpXe
   wins support = no
   dns proxy = no
   interfaces = 127.0.0.0/8 eth0
   bind interfaces only = yes

   log file = /var/log/samba/log.%m
   max log size = 1000

   server role = standalone server

   passdb backend = tdbsam
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .

   pam password change = yes
   map to guest = bad user

   usershare allow guests = yes

[Samba]
   comment = Samba
   path = /mnt/samba
   browseable = yes
   read only = yes
   security = share
   quest ok = yes
" > /etc/samba/smb.conf
