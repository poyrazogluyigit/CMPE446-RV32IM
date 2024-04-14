#include "parameters.hpp"


// this function is for R-type instructions
arith_type OP_AL_32I(opcode_type opcode, func7_type func7, func3_type func3, r_type op1, r_type op2){

	r_type rd_val = 0;
	ctl_type status = 0;


	// calculate immediate values
	imm_type immediate = (func7, op2);
	ap_uint<6> shamt = immediate & 0b111111;


	switch(opcode){
	case OP_AL_R: { // register arguments
		switch(func7){ //func7
				case FUNC7_0:
					switch(func3){
					case ADD: rd_val =  op1 + op2; break;
					case SLL: rd_val = op1 << op2; break;
					case SLT: op1 < op2 ? rd_val = 1 : rd_val = 0; break;
					case SLTU:(uns)op1<(uns)op2 ? rd_val = 1 : rd_val =0; break;
					case XOR: rd_val = op1 ^ op2;break;
					case SRL: rd_val = (uns) op1 >> op2;break;
					case OR:  rd_val = op1 | op2;break;
					case AND: rd_val = op1 & op2;break;
					default: //illegal func3
						status = 1;
						break;
					}
					break;
				case FUNC7_32:
					switch(func3){ //func3
					case SUB: rd_val = op1 - op2; break;
					case SRA: rd_val = op1 < 0 ? ~(~op1 >> op2) : op1 >> op2 ;break;
					default: // illegal func3
						status = 1;
						break;
					}
					break;
				default: //illegal func7
					status = 1;
					break;
				}
	}
	break;
	case OP_AL_I: { // immediate argument
		switch(func3){ //func3
				case ADDI: rd_val =  op1 + immediate; break;
				case SLTI: op1 < immediate ? rd_val = 1 : rd_val = 0; break;
				case SLTIU:(uns)op1 < (uns)immediate ? rd_val = 1 : rd_val = 0; break;
				case XORI: rd_val = op1 ^ immediate; break;
				case ORI:  rd_val = op1 | immediate; break;
				case ANDI: rd_val = op1 & immediate; break;
				case SLLI:
				if (func7 == 0) rd_val = op1 << shamt;
				// illegal func7
				else status = 1;
				break;
				// for right shifts, classify by func7
				case SRL:
				if (func7 == 0)  rd_val = (uns) op1 >> immediate;
				else if (func7 == 32) rd_val = op1 < 0 ? ~(~op1 >> shamt) : op1 >> shamt;
				// illegal func7 for right
				else status = 1;
				break;
				default: //illegal func3
					status = 1;
					break;
				}
	}
	break;
	// illegal opcode
	default: status = 1; break;
	}

	return {rd_val, status};
}
