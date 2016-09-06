#!/bin/bash
set -e
set -v

export PREFIX="$PWD/compiler"
export TARGET=i686-elf

# build binutils
mkdir -p build-binutils
cd build-binutils
../binutils-2.27/configure --target=$TARGET --prefix=$PREFIX --with-sysroot --disable-nls --disable-werror
make
make install
cd ..


# build gcc
mkdir -p build-gcc
cd build-gcc
../gcc-6.2.0/configure --target=$TARGET --prefix=$PREFIX --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
cd ..

