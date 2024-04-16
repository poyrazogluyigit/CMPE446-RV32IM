#include "parameters.hpp"

hart_return_type OP_AL_32B(imm_type imm, func3_type func3, r_type op1, r_type op2){

	pc_type mdf = 4;
	ctl_type status = 0;

	switch (func3){
		case BEQ: mdf = op1 == op2 ? (pc_type) imm : (pc_type) 4; break;
		case BNE: mdf = op1 != op2 ? (pc_type) imm : (pc_type) 4; break;
		case BLT: mdf = op1 < op2 ? (pc_type) imm : (pc_type) 4; break;
		case BGE: mdf = op2 > op1 ? (pc_type) imm : (pc_type) 4; break;
		case BLTU: mdf = (uns) op1 < (uns) op2 ? (pc_type) imm << 1 : (pc_type) 4; break;
		default: //invalid func3
			status = 1;
			mdf = 0;
			break;
	}
	return {0, (uns) mdf, status};
}
