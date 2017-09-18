# docker-pxe

This is a container to docker which contain a script, minimalize image linux and other to build a server PXE. 
Container consist of:
* DHCP server
* TFTP server
* Samba server

Build:

```
docker build -t pxe .
```

Run:

```
docker run -d --name pxe -v D:\pxe:/var/pxe/ -it pxe bash
```

Where partition `D:\pxe' include files: pxelinux.0, memdisk, winpe and other.
