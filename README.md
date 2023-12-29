# Linux integer output

Here are some source files written in GNU assembly. The resulting executeable outputs an integer to the terminal.

The files are taken from the book "Programming from the ground up" written by Jonathan Bartlet.


## Building the executeable

``` assembly
as --32 -g write_newline.s -o write_newline.o
as --32 -g count_chars.s -o count_chars.o
as --32 -g integer_to_string.s -o integer_to_string.o
as --32 -g conversion_program.s -o conversion_program.o
ld -m elf_i386 integer_to_string.o count_chars.o write_newline.o conversion_program.o -o conversion_program
```

To run the program, write `./conversion_program` on the terminal.
