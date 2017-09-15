#!/bin/bash

set -e

echo -ne "default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 8.8.8.8;
authoritative;

subnet $network netmask $mask {
  range $range_from $range_to;
  option subnet-mask $mask;
  option routers $ip;
  option broadcast-address $broadcast;
  filename \"pxelinux.0\";
}
" > /etc/dhcp/dhcpd.conf

echo "INTERFACESv4=\"eth0\"" > /etc/default/isc-dhcp-server
touch /var/lib/dhcp/dhcpd.leases