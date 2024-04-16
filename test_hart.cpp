#include <iostream>
#include "parameters.hpp"
using namespace std;


int main(void) //execution environment
{
	// instruction memory, assumes 32-bit interface
	inst_type code[]={0x01428293,
			0x00130313,
			0x006303b3,
			0x40728e33,
			0x01c05663,
			0x00130313,
			0xfe0006e3,
			0x00008067};

	// define output
	superscalar_type output = {0, 0, 0};

	int N=sizeof(code)>>2;

	unsigned int pc = output.next_pc;

	while((pc >> 2) < N)
	{
		// print pc and instruction values for simulation purposes
		cout << pc << " " << hex << (uns) code[pc>>2] << " " << (uns) code[pc+4>>2] << endl;
		output = top_module(pc, code[pc>>2], code[pc+4>>2]);
		cout << output.next_pc << " next pc" << endl;
		pc = output.next_pc;
	}
	return 0;

}

