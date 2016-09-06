CC := tools/compiler/bin/i686-elf-g++
AS := tools/compiler/bin/i686-elf-as
FLAGS := -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS := -ffreestanding -O2 -nostdlib -lgcc
TARGET := kernel
SDIR := src
SOURCES := $(shell find $(SDIR) -name "*.c")
OBJECTS := $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS) boot.o
	$(CC) -T linker.ld -o $@.bin $^ $(LFLAGS)

%.o: %.c
	$(CC) -c $< -o $@ $(FLAGS)

boot.o:
	$(AS) boot.s -o boot.o

iso:
	mkdir -p iso/boot/grub
	cp $(TARGET).bin iso/grub/$(TARGET).bin
	cp grub.cfg iso/grub/grub.cfg
	grub-mkrescue -o $(TARGET).iso iso
	rm -r iso

