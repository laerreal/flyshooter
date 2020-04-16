all: boot.bin

%.bin : %.asm
	fasm $^

clean:
	rm -rf boot.bin

fixup_coding_style:
	./cs.py *.asm
