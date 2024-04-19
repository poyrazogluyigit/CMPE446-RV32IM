#include "parameters.hpp"

using namespace std;

superscalar_type top_module(pc_type pc, inst_type inst1, inst_type inst2){

	static r_type rf[XLEN];
#pragma HLS ARRAY_PARTITION dim=1 type=complete variable=rf

	pc_type next_pc = pc;



	hart_return_type ret1 = hart(inst1, pc, rf[inst1.range(19, 15)], rf[inst1.range(24, 20)]);
#pragma HLS INLINE off
	hart_return_type ret2 = hart(inst2, pc, rf[inst2.range(19, 15)], rf[inst2.range(24, 20)]);
#pragma HLS INLINE off


	static ap_uint<1> d_haz;
	hazard_type control = hazard_detector(inst1, inst2, ret1.next_pc, ret1.valid, ret2.valid, d_haz);
	d_haz = control.set_cycle;


	if (control.write1) rf[inst1.range(11,7)] = ret1.result;
	if (control.write2) rf[inst2.range(11, 7)] = ret2.result;
	switch((control.pc2, control.pc1)){
	case 0:
		next_pc = pc; break;
	case 1:
		next_pc = pc + ret1.next_pc; break;
	case 2:
		next_pc = pc + ret2.next_pc; break;
	case 3: next_pc = pc + ret1.next_pc + ret2.next_pc; break;
	default: break;
	}

	rf[0] = 0;

	return {next_pc, ret1.valid, ret2.valid};



}
