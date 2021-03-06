Machinekit Image chroot Helper Scripts
======================================
A repository accumulating scripts and information for changerooting a Machinekit image for the BeagleBone Black. 
In order to get started the scripts must be run in alphabetical order:

* 01-xxx
* 02-yyy
* 03-zzz
* ...
* 0N-nnn

General Workflow
================
1. Usually one runs script **01-download-image.sh** or downloads the image manually to this folder.

1. Since we mostly use the downloaded ARM image on non ARM host systems we need to make sure the correct emulator is used. 
For this reason make **qemu-arm-static** has to be installed before **sudo 02-set-binfmt.sh** can be used. 
        ````
        sudo apt-get install qemu-user-static
        ```` 

1. Before processing, the image must be mounted correctly, thus run **sudo 03-mount-root.sh** and **sudo 04-mount-sys.sh**. Also copy the **qemu-arm-static** to the changeroot:

        ````
        sudo cp /usr/bin/qemu-arm-static ./root/usr/bin/
        ````


1. Chroot to the root directory and do your work:
        ````
        sudo chroot ./root /bin/bash
        root@yourpc:/# su - machinekit
        machinekit@yourpc:/$ 
        ````

1. Cleanup after finishing work: **sudo 05-umount-all.sh**


Scripts
=======
* 01-download-image.sh

Downloads the image. You must extract it maually. Take a look into the file!

* 02-set-binfmt.sh

Writes to proc which emulator is to be used for ARM binaries.

* 03-mount-root.sh

Mounts the image (hopefully) with the correct offset. If mount fails check the offset as explained in the Mount Offset section.

* 04-mount-sys.sh

Mounts sys dev proc to the changeroot.

* 05-umount-all.sh

Cleanup script.


Further Informations
====================

* [Creating a Machinekit Debian Image](https://github.com/machinekoder/asciidoc-sandbox/wiki/Creating-a-Machinekit-Debian-Image)

* [Machinekit development setup guide](http://www.machinekit.io/docs/developing/machinekit-developing/#install-development-packages)

* [BBB Overlays](https://github.com/beagleboard/bb.org-overlays)

* [Compiling an Overlay](https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay)

* [Cross Compilation for ARM guide](https://community.arm.com/iot/embedded/b/embedded-blog/posts/cross-compilation-for-arm)

* [BBB Debian images](http://elinux.org/Beagleboard:BeagleBoneBlack_Debian#BBW.2FBBB_.28All_Revs.29_Machinekit)


Mount Offset
============
The partition offset needed to mount the image corresponds to the partition's block size times partition start.
Partition infos can be found by using fdisk:

````
fdisk -l image.img
````
In our case: 512 * 8192 = 4194304


