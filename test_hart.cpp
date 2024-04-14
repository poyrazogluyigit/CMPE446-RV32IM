#include <iostream>
#include "parameters.hpp"
using namespace std;


int main(void) //execution environment
{
	// instruction memory, assumes 32-bit interface
	inst_type code[]={
						0x00500093,
						0x00700113,
						0x00208463,
						0x00108093,
						0x00500193,
						0x00500213,
						0x00419463,
						0x00108093,
						0x00500293,
						0x00700313,
						0x0062c463,
						0x00108093,
						0x00700393,
						0x00500413,
						0x0083d463,
						0x00108093,
						0x00000493,
						0xfff00513,
						0x00a4e463,
						0x00108093,
						0xfff00593,
						0x00000613,
						0x00c5f463,
						0x00108093,
						0x00500093,
						0x00c000ef,
						0x00000013,
						0x008000ef,
						0x00408167,
						0x000010b7,
						0x00002097,
						0x00500093};

	// define output
	hart_return_type output = {0, 0};

	int N=sizeof(code)>>2;

	unsigned int pc = output.next_pc;

	while((pc >> 2)< N)
	{
		// print pc and instruction values for simulation purposes
		cout << pc << " " << hex << (uns) code[pc>>2] << endl;
		output = hart(code[pc>>2], pc);
		pc = output.next_pc;
		// print illegal instruction and halt execution
		if (output.valid == 1){
			cout << "Illegal instruction " << code[pc>>2] << endl;
			break;
		}

	}
	return 0;

}

