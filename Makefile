CC := tools/compiler/bin/i686-elf-g++
AS := tools/compiler/bin/i686-elf-as
FLAGS := -std=gnu99 -ffreestanding -O2 -Wall -Wextra
TARGET := kernel

all: $(TARGET)

$(TARGET):
	$(AS) boot.s -o boot.o
	$(CC) -c $(TARGET).c -o $(TARGET).o $(FLAGS)
	$(CC) -T linker.ld -o os.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

clean:
	rm kernel.o boot.o
