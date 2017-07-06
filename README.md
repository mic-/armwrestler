# armwrestler
Instruction tester for ARM emulators


Note that this is not a total test - it does not test every instruction
or every combination of operands. So even if you don't get any errors
there may still be bugs left. Also, to even be able to run the test,
some of the more common operations must obviously be at least partially
working. These include ADD, SUB, CMP, TEST, ORR, BNE, LDMIA and some
others.

Additional notes for the DS version:

 Since this version was made to run on the DS it also requires the VRAM
 display (framebuffer/LCDC) mode to be emulated in order to get any
 output.


Notation
--------
Some terms are used in the program that may require explanations:

* Rd	Destination register
* Rn	Base address register
* MEM	A value previously written to memory

	
* +#]	Pre-increment with immediate offset
* -R]!	Pre-decrement with register offset and writeback
* ]+R	Post-increment with register offset
* ...and so on


Hints
-----
These are some things to look for if you are getting errors in any of
the tests.

* For all instructions using the barrel shifter: Make sure the special cases
are handled correctly. That is, shifts by zero, register-specified shift
amounts larger than 31, and so on.

* For LDR instructions: Make sure word-sized loads from unaligned addresses
are handled correctly. Make sure the case when Rd==Rn is handled correctly.

* For STR instructions: Make sure the case when storing R15 is handled correctly.

* For LDM instructions: Make sure writeback is done at the right time.
