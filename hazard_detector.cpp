#include "parameters.hpp"

using namespace std;

hazard_type hazard_detector(inst_type inst1, inst_type inst2, pc_type next_pc1, ctl_type valid1, ctl_type valid2, ctl_type d_haz){
	opcode_type opcode1 = inst1.range(6, 0);
	opcode_type opcode2 = inst2.range(6, 0);

	// first we will see whether result of one operation is used in other
	// a hazard exists if: inst2 reads on result of inst1

	rf_pntr_type i2rd = inst2.range(11, 7);
	rf_pntr_type i2rs1 = inst2.range(19, 15);
	rf_pntr_type i2rs2 = inst2.range(24,20);
	rf_pntr_type i1rd = inst1.range(11, 7);


	ap_uint<1> jump = next_pc1 != 4 ? 1 : 0;

	ap_uint<1> data = 0;

	ap_uint<1> inst1_has_rd = !(opcode1 == OP_AL_B);
	ap_uint<1> inst2_has_rd = !(opcode2 == OP_AL_B);


	switch(opcode2){
	case OP_AL_I:
	case JALR:
		// data hazard - inst2 uses result of inst1 as operand
		// JALR and OP_AL_I only have rs1, so we only need to check that
		if (inst1_has_rd && i1rd == i2rs1) data = 1; break;
	case OP_AL_R:
	case OP_AL_B:
		// data hazard - inst2 uses result of inst1 as operand
		// OP_AL_R and OP_AL_B have rs1 and rs2
		if (inst1_has_rd != OP_AL_B && (i1rd == i2rs1 || i1rd == i2rs2)) data = 1; break;
	default: // JAL, AUIPC, LUI do not contain rs.
		break;
	}


	ap_uint<1> write1 =  inst1_has_rd && (!(d_haz) && valid1);
	ap_uint<1> write2 = inst2_has_rd && (valid1 && valid2 && ((data && d_haz) || !data && !jump));
	ap_uint<1> pc1 = valid1 && (!data || jump || (data && d_haz));
	ap_uint<1> pc2 = valid1 && valid2 && ((data && d_haz) + (!data && !jump));

	ap_uint<1> set_cycle = data && (d_haz != 1);


	return {write1, write2, pc1, pc2, set_cycle};

}
