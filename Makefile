all: boot.bin

%.bin : %.asm
	fasm $^

clear:
	rm -rf boot.bin

fixup_coding_style:
	./cs.py *.asm
