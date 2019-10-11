path c:\qemu
start qemu -s -S -p 1666 -hda boot.bin -L "c:\qemu\lib"
gdb --command=c:\qemu\gdb.txt
pause