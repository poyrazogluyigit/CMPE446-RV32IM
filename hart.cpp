#include "parameters.hpp"
using namespace std;

hart_return_type hart(inst_type inst, pc_type pc)
{
	opcode_type opcode;
	rf_pntr_type rd,rs1, rs2;
	func3_type func3;
	func7_type func7;
	static r_type rf[XLEN];
	pc_type next_pc;


	imm_type imm_11_0;
	unsigned imm_31_12;
	imm_type imm_b_type;
	imm_type imm_jal_type;

	ctl_type status = 0;

	// extract the bit fields of the instruction
    opcode= inst.range(6,0) ;
	rd = inst.range(11,7);
	rs1= inst.range(19,15);
	rs2= inst.range(24,20);
	func3= inst.range(14,12);
	func7= inst.range(31,25);

	imm_31_12 = (imm_type) imm_20_type(inst.range(31, 12));
	imm_b_type = (imm_type) ((ap_int<12>)(ap_int<1>(inst[31]), ap_int<1>(inst[7]), ap_int<6>(inst.range(30, 25)), ap_int<4>(inst.range(11, 8)))) << 1;
	imm_jal_type = (imm_type) ((ap_int<20>)(ap_int<1>(inst[31]), ap_int<8>(inst.range(19, 12)), ap_int<1>(inst[20]), ap_int<10>(inst.range(30, 21)))) << 1;

	arith_type atmp;
	jump_type jtmp;

	switch(opcode){
	case OP_AL_B: jtmp = OP_AL_32B(imm_b_type, func3, rf[rs1], rf[rs2]); status = jtmp.valid; next_pc = pc + (sgn) jtmp.value; break;
	case LUI: rf[rd] = imm_31_12 << 12; break;
	case AUIPC: rf[rd] = imm_31_12 << 12 + pc; break;
	case JAL: rf[rd] = pc + 4; next_pc = pc + imm_jal_type; break;
	case JALR: if (func3 != 0) status = 1;
				else {
					r_type t = pc + 4;
					next_pc = ((imm_type)(func7, rs2) + rf[rs1]);
					next_pc.clear(0);
					rf[rd] = t;
				}break;

    default: atmp = OP_AL_32I(opcode, func7,func3,rf[rs1],rf[rs2]); status = atmp.valid; if (status == 0) rf[rd] = atmp.value; break;

	}
	if (opcode != JAL || opcode != JALR || opcode != OP_AL_B) {
		next_pc = pc + 4;
	}

	// hard code x0 = 0
	rf[0] = 0;

	return {next_pc, status};
}
