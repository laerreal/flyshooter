all: boot.bin

boot.bin: \
	Makefile \
	$(shell ./includes.py boot.asm) \
	./includes.py

%.bin : %.asm
	fasm $<

clean:
	rm -rf boot.bin

fixup_coding_style:
	./cs.py *.asm
