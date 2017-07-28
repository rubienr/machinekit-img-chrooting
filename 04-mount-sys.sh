#!/bin/bash

mount --bind /proc root/proc
mount --bind /tmp root/tmp
mount --bind /sys root/sys
mount --bind /dev root/dev
mount --bind /dev/pts root/dev/pts

