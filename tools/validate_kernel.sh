#!/bin/bash
[[ ! -f $1 ]] && echo "argument must be a file" && exit 1


if grub-file --is-x86-multiboot $1; then
  echo "multiboot confirmed"
else
  echo "the file is not multiboot"
fi
