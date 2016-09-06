#!/bin/bash
mkdir -p iso/boot/grub
cp os.bin iso/boot/os.bin
cp grub.cfg iso/boot/grub/grub.cfg
grub-mkrescue -o os.iso iso
rm -r iso
