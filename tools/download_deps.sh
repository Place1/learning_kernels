#!/bin/bash
set -e

mkdir -p deps
pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/deps"

curl -L -o 'binutils-2.26.tar.gz' 'ftp://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz' &
curl -L -o 'gcc-6.2.0.tar.gz' 'ftp://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.gz' &
wait

tar xvzf 'binutils-2.26.tar.gz' &
tar xvzf 'gcc-6.2.0.tar.gz' &
wait

popd
exit 0
