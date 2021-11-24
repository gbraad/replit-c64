# Commodore 64 Dev Environment

This Repl provides a starting point from which you can develop programs
for a Commodore 64. You can test using the [VICE emulator](https://vice-emu.sourceforge.io/).

## Makefile

A basic `Makefile` is provided that compiles `asmprog.s` into `asmprog.prg`
and `cprog.c` into `cprog.prg`. Additional steps in the `Makefile`
turn these into a loadable disk image.

`make run` will run VICE with the built disk image attached as device 8.

## C Programs

`cprog.c` uses `printf` to write some text to the screen.

## ASM Programs

`asmprog.s` directly increments video registers to change colors on the screen.

## BASIC Programs

`basicprog.bas` writes some text to the screen.

## How to Run

Once VICE loads, at the BASIC prompt:
```
LOAD "ASMPROG",8
```

Once the program loads, you can type:
```
RUN
```
to run the program.

To load the C program, replace the first `LOAD` with this:
```
LOAD "CPROG",8
```

## Writing BASIC

You can also type your BASIC programs directly into the emulator, for example:
```
10 PRINT "HELLO WORLD"
20 GOTO 10
RUN
```

Hit the Escape key to stop the program running.

## Saving and Loading Programs

Once you have written a BASIC program in the emulator, you may want
to save it.

The `myprogs.d64` disk is loaded as drive 9 in the emulator for this purpose.

Let's take this BASIC program:
```
10 PRINT "HELLO WORLD"
RUN
```

It'll print `HELLO WORLD` to the screen.

To save,
```
SAVE "HELLO",9
```

Once saved, you can load the program again after a restart:
```
LOAD "HELLO",9
LIST
RUN
```