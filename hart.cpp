#include "parameters.hpp"
using namespace std;

hart_return_type hart(inst_type inst, pc_type pc, r_type op1, r_type op2)
{
	opcode_type opcode;
	func3_type func3;
	func7_type func7;

	unsigned imm_31_12;
	imm_type imm_b_type;
	imm_type imm_jal_type;

	ctl_type status = 0;

	// extract the bit fields of the instruction
    opcode= inst.range(6,0) ;
	func3= inst.range(14,12);
	func7= inst.range(31,25);

	imm_31_12 = (imm_type) imm_20_type(inst.range(31, 12));
	imm_b_type = (imm_type) ((ap_int<12>)(ap_int<1>(inst[31]), ap_int<1>(inst[7]), ap_int<6>(inst.range(30, 25)), ap_int<4>(inst.range(11, 8)))) << 1;
	imm_jal_type = (imm_type) ((ap_int<20>)(ap_int<1>(inst[31]), ap_int<8>(inst.range(19, 12)), ap_int<1>(inst[20]), ap_int<10>(inst.range(30, 21)))) << 1;

	hart_return_type res;

	switch(opcode){
	case OP_AL_B: res = OP_AL_32B(imm_b_type, func3, op1, op2); break;
	case LUI: res.result = imm_31_12 << 12; res.next_pc = 4; res.valid = 1; break;
	case AUIPC: res.result = imm_31_12 << 12 + pc; res.next_pc = 4; res.valid = 1; break;
	case JAL: res.result = pc + 4; res.next_pc = imm_jal_type; res.valid = 1; break;
	case JALR: {res.valid = !(func3.or_reduce());
				res.result = pc + 4;
				res.next_pc = (imm_type(inst.range(31, 20)) + op1);
				res.next_pc.clear(0);
				break;
	}
    default: res = OP_AL_32I(inst, func7,func3,op1,op2); break;
	}

	return res;
}
