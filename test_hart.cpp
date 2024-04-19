#include <iostream>
#include "parameters.hpp"
using namespace std;


int main(void) //execution environment
{
	// instruction memory, assumes 32-bit interface
	/*
	addi t0, t0, 1
	addi t1, t1, 2
	add t2, t1, t0
	slli t2, t2, 3
	sub t2, t2, t0
	add t3, t0, t1

	inst_type code[]={
	0x00128293,
	0x00230313,
	0x005303b3,
	0x00339393,
	0x405383b3,
	0x00628e33
};
*/

/*
	coprime:
		addi a0, zero, 29
		addi a1, zero, 7
		jal ra, gcd
		beq a0, zero, out
		addi a0, zero, 1
		j out
	gcd:
		beqz a1, done
		blt a1, a0, bigger
		sub a1, a1, a0
		j gcd
	bigger:
		mv t0, a1
		mv a1, a0
		mv a0, t0
		j gcd
	done:
		ret
	out:
		addi a0, zero, 1024
*/

/*
	inst_type code[]={
	0x01d00513,
	0x00700593,
	0x010000ef,
	0x02050863,
	0x00100513,
	0x0280006f,
	0x02058063,
	0x00a5c663,
	0x40a585b3,
	0xff5ff06f,
	0x00058293,
	0x00050593,
	0x00028513,
	0xfe5ff06f,
	0x00008067,
	0x40000513
};

*/


/*
 	lui a0, 0xF0ab
	addi a0, a0, 500
	addi a1, zero, 1
	mv s0, zero
	loop:
	and t0, a1, a0
	add s0, s0, t0
	srli a0, a0, 1
	bnez a0, loop

*/

inst_type code[]={
	0x0f0ab537,
	0x1f450513,
	0x00100593,
	0x00000413,
	0x00a5f2b3,
	0x00540433,
	0x00155513,
	0xfe051ae3
	};


/*

	unrolled:


	lui a0, 0xF0ab
	addi a0, a0, 500
	addi a1, zero, 1
	addi a2, zero, 2
	addi a3, zero, 4
	addi a4, zero, 8
	mv s0, zero
	nop
	loop:
	and t0, a1, a0
	and t1, a2, a0
	and t2, a3, a0
	and t3, a4, a0
	add t0, t1, t0
	add t2, t3, t2
	add s0, t2, t0
	srli a0, a0, 4
	bnez a0, loop
	nop
 */

/*
inst_type code[] = {
	0x0f0ab537,
	0x1f450513,
	0x00100593,
	0x00200613,
	0x00400693,
	0x00800713,
	0x00000413,
	0x00000013,
	0x00a5f2b3,
	0x00a67333,
	0x00a6f3b3,
	0x00a77e33,
	0x005302b3,
	0x007e03b3,
	0x00538433,
	0x00455513,
	0xfe0510e3,
	0x00000013
};
*/


	// define output
	superscalar_type output = {0, 0, 0};

	int N=sizeof(code)>>2;

	unsigned int pc = output.next_pc;

	int i = 0;

	while((pc >> 2) < N)
	{
		// print pc and instruction values for simulation purposes
		cout << "inst " << i << "pc "<< pc << " " << hex << (uns) code[pc>>2] << " " << (uns) code[pc+4>>2] << endl;
		output = top_module(pc, code[pc>>2], code[pc+4>>2]);
		cout << output.next_pc << " next pc" << endl;
		pc = output.next_pc;
		if (!output.first_valid || !output.second_valid){
			cout << "Invalid instruction" << endl;
			break;
		}
		i++;
	}
	return 0;

}

