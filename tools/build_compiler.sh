#!/bin/bash
set -e
set -v

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install system dependencies
echo "installing system dependencies with packages.sh"
./packages.sh > /dev/null

# preconditions. make sure gcc and binutils are downloaded and extracted
if [[ ! -d binutils-2.27  || ! -d gcc-6.2.0 ]]; then
  ./download_deps.sh
fi

export PREFIX="$PWD/compiler"
export TARGET=i686-elf

# build binutils
mkdir -p deps/build-binutils
pushd deps/build-binutils
../binutils-2.27/configure --target=$TARGET --prefix=$PREFIX --with-sysroot --disable-nls --disable-werror
make
make install
popd


# build gcc
mkdir -p deps/build-gcc
pushd deps/build-gcc
../gcc-6.2.0/configure --target=$TARGET --prefix=$PREFIX --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
popd

popd
exit 0
