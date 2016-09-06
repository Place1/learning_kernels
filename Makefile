CC := tools/compiler/bin/i686-elf-g++
FLAGS := -std=gnu99 -ffreestanding -O2 -Wall -Wextra
TARGET := kernel

all: $(TARGET)

$(TARGET):
	$(CC) -c $(TARGET).c -o $(TARGET).o $(FLAGS)

clean:
	rm kernel.o
