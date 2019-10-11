all: boot.bin

%.bin : %.asm
	fasm $^

clear:
	rm -rf boot.bin
