default: 
	make img

ipl.bin:
	nasm -o bin/ipl.bin ipl.asm

helloos.img:
	make ipl.bin
	mv bin/ipl.bin bin/helloos.img

asm:
	make -r ipl.bin

img:
	make -r helloos.img

run:
	make img
	qemu-system-i386 -fda bin/helloos.img

clean:
	rm bin/*