# Linux integer output

Here are some source files written in GNU assembly. The resulting executeable outputs an integer to the terminal.

The files are taken from the book
[Programming from the ground up](https://www.cs.princeton.edu/courses/archive/spr04/cos217/reading/ProgrammingGroundUp-1-0-booksize.pdf)
written by Jonathan Bartlet.


## Building a test program

To build a test program that prints the number of 824 to the terminal, follow the following steps:

``` makefile
as --32 -g write_newline.s -o write_newline.o
as --32 -g count_chars.s -o count_chars.o
as --32 -g integer_to_string.s -o integer_to_string.o
as --32 -g conversion_program.s -o conversion_program.o
ld -m elf_i386 integer_to_string.o count_chars.o write_newline.o conversion_program.o -o conversion_program
```

To run the program, write `./conversion_program` on the terminal.


## Print the multiples of 3 and 5 between 0 and 512 and their sum



``` makefile
as --32 -g write_newline.s -o write_newline.o
as --32 -g count_chars.s -o count_chars.o
as --32 -g integer_to_string.s -o integer_to_string.o
as --32 -g conversion_program.s -o conversion_program.o
as --32 -g print_inreger.s -o print_integer.o
as --32 -g print_multiples.s -o print_multiples.o
ld -m elf_i386 integer_to_string.o count_chars.o write_newline.o print_integer.o print_multiples -o multiple
```

To run the program, write `./multiple` on the terminel. The printed sum of the multiples should be 60945.


## Verification of the result



``` python-console
>>> sum = (3 * 170 * 171 + 5 * 102 * 103 - 15 * 34 * 35) / 2
>>> sum
60945.0
```


