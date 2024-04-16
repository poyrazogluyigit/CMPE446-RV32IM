#include "parameters.hpp"
#include <iostream>

using namespace std;

superscalar_type top_module(pc_type pc, inst_type inst1, inst_type inst2){

	static r_type rf[XLEN];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=rf
	rf[0] = 0;

	pc_type next_pc = 0;

	hart_return_type ret1 = hart(inst1, pc, rf[inst1.range(19, 15)], rf[inst1.range(24, 20)]);
#pragma HLS INLINE off
	hart_return_type ret2 = hart(inst2, pc, rf[inst2.range(19, 15)], rf[inst2.range(24, 20)]);
#pragma HLS INLINE off

	cout << "first " << ret1.next_pc << "result " << ret1.result << endl;
	cout << "second " << ret2.next_pc << "result " << ret2.result << endl;

	static ap_uint<1> dh_reg;
	// hazard detection block
	hazard_type hazard = hazard_detector(inst1, inst2);
	cout << "hazard " << hazard << endl;

	// first instruction returns 4 as next_pc
	if (ret1.next_pc == 4){
		// now we need to see data hazards
		if (hazard[0] == 0){ // there is no data hazard
			// write result of hart1 if instruction has a rd
			if (inst1.range(6, 0) != OP_AL_B) rf[inst1.range(11, 7)] = ret1.result;
			// write result of hart2 if instruction has a rd
			if (inst2.range(6, 0) != OP_AL_B) rf[inst2.range(11, 7)] = ret2.result;
			// if inst2 is a control flow instruction, update next pc accordingly
			next_pc = ret1.next_pc + ret2.next_pc;
		}

		else { // there is a data hazard
			// if on first iteration, save current instruction and return current pc
			// write result of hart1 if instruction has a rd
			if (dh_reg != 1){
				dh_reg = 1;
				if (inst1.range(6, 0) != OP_AL_B) rf[inst1.range(11, 7)] = ret1.result;
				// do nothing to pc
			}
			// if on second iteration, write result of hart2 if instruction has a rd
			// return next_pc = inst1 + inst2
			else {
				dh_reg = 0;
				if (inst2.range(6, 0) != OP_AL_B) rf[inst2.range(11, 7)] = ret2.result;
				// set next_pc to inst1 + inst2
				next_pc = ret1.next_pc + ret2.next_pc;
			}
		}
	}
	// first instruction returns next_pc != 4, ignore second one
	else{
		// write result of hart1 if instruction has rd
		if (inst1.range(6, 0) != OP_AL_B) rf[inst1.range(11, 7)] = ret1.result;
		next_pc = ret1.next_pc;
	}

	pc_type xx = pc + next_pc;

	return {xx, ret1.valid, ret2.valid};



}
