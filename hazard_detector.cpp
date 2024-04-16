#include "parameters.hpp"
#include <iostream>

using namespace std;

hazard_type hazard_detector(inst_type inst1, inst_type inst2){
	opcode_type opcode1 = inst1.range(6, 0);
	opcode_type opcode2 = inst2.range(6, 0);
	hazard_type hazard = 0;

	// first we will see whether result of one operation is used in other
	// a hazard exists if: inst2 reads on result of inst1
	rf_pntr_type i2rd = inst2.range(11, 7);
	rf_pntr_type i2rs1 = inst2.range(19, 15);
	rf_pntr_type i2rs2 = inst2.range(24,20);
	rf_pntr_type i1rd = inst1.range(11, 7);

	cout << i1rd << " "<< i2rs1 << " " << i2rs2 << " " << i2rd << endl;


	switch(opcode2){
	case OP_AL_I:
	case JALR:
		// data hazard - inst2 uses result of inst1 as operand
		// JALR and OP_AL_I only have rs1, so we only need to check that
		if (opcode1 != OP_AL_B && i1rd == i2rs1) hazard[0] = 1; break;
	case OP_AL_R:
	case OP_AL_B:
		// data hazard - inst2 uses result of inst1 as operand
		// OP_AL_R and OP_AL_B have rs1 and rs2
		if (opcode1 != OP_AL_B && (i1rd == i2rs1 || i1rd == i2rs2)) hazard[0] = 1; break;
	default: // JAL, AUIPC, LUI do not contain rs.
		break;
	}

	// now we will need to check control hazard:
	if (opcode1 == OP_AL_B || opcode1 == JAL || opcode1 == JALR) hazard[1] = 1;

	return hazard;

}
