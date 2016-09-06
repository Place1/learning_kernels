CC := tools/compiler/bin/i686-elf-g++
AS := tools/compiler/bin/i686-elf-as
FLAGS := -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS := -ffreestanding -O2 -nostdlib -lgcc
TARGET := kernel
SDIR := src
ODIR := build
SOURCES := $(shell find $(SDIR) -name "*.c")
OBJECTS := $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS) boot.o
	@mkdir -p $(ODIR)
	$(CC) -T linker.ld -o $(ODIR)/$@.bin $^ $(LFLAGS)

%.o: %.c
	$(CC) -c $< -o $@ $(FLAGS)

boot.o:
	$(AS) boot.s -o boot.o

iso: $(TARGET)
	mkdir -p iso/boot/grub
	cp $(ODIR)/$(TARGET).bin iso/grub/$(TARGET).bin
	cp grub.cfg iso/grub/grub.cfg
	grub-mkrescue -o $(ODIR)/$(TARGET).iso iso
	rm -r iso

clean:
	find ./ -type f -name "*.o" -exec rm {} \;
	rm -r $(ODIR)
