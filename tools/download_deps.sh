#!/bin/bash
curl -L -o http://wiki.qemu-project.org/download/qemu-2.7.0.tar.bz2


curl -L -o binutils-2.26.tar.gz binutils-2.26.tar.gz ftp://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz
tar xvzf binutils-2.26.tar.gz

curl -L -o gcc-6.2.0.tar.gz gcc-6.2.0.tar.gz ftp://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.gz
tar xvzf gcc-6.2.0.tar.gz

