## how to build

First build the cross-compiler
```
./tools/build_compiler.sh
```

Then build the iso
```
make iso
```

## run the iso with qemu
qemu-system-i386 build/PlaceOS.iso

