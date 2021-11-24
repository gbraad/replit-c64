
CC := cc65
AS := ca65
CL := cl65
C1541 := c1541
VICE := x64sc
PETCAT := petcat

all: disk.64

cprog.prg: cprog.c
	$(CL) --mapfile cprog.map -t c64 -o $@ $<

asmprog.prg: asmprog.s
	$(CL) --mapfile asmprog.map -u __EXEHDR__ -t c64 -C c64-asm.cfg -o $@ $<

basicprog.prg: basicprog.bas
	$(PETCAT) -w2 -o $@ $<

progs: cprog.prg asmprog.prg basicprog.prg

disk.d64: Makefile progs
	$(C1541) -format "disk,id" d64 $@
	$(C1541) -attach $@ -write cprog.prg cprog
	$(C1541) -attach $@ -write asmprog.prg asmprog
	$(C1541) -attach $@ -write basicprog.prg basicprog

myprogs.d64:
	$(C1541) -format "myprogs,id" d64 $@

run: disk.d64 myprogs.d64
	$(VICE) -8 disk.d64 -9 myprogs.d64 -device9 1 -drive9type 3

clean:
	rm -f disk.d64
	rm -f cprog.prg cprog.map
	rm -f asmprog.prg asmprog.map
