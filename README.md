Machinekit Image chroot Helper Scripts
======================================
A repository accumulating scripts and information for changerooting a Machinekit image for the BeagleBone Black. 
In order to get started the scripts must be run in alphabetical order:

* 01-xxx
* 02-yyy
* 03-zzz
* ...
* 0N-nnn

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
* [Machinekit development setup guide](http://www.machinekit.io/docs/developing/machinekit-developing/#install-development-packages)

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


