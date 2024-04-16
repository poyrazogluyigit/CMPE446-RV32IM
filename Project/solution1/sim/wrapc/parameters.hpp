#include <cmath>
#include "ap_fixed.h"
using namespace std;

#define XLEN 32
#define STACKSIZE 100
#define RF_PNTR_WIDTH 5
#define OPCODE_WIDTH 7
#define FUNC3_WIDTH 3
#define FUNC7_WIDTH 7
#define CTL_WIDTH 1

#define AUIPC 0b0010111
#define LUI 0b0110111
#define OP_AL_I 0b0010011
#define OP_AL_R 0b0110011
#define OP_AL_B 0b1100011
#define JAL 0b1101111
#define JALR 0b1100111

#define R_0TYPE 0b01100110000000
#define R_32TYPE 0b01100110100000
#define I_0TYPE 0b00100110000000
#define I_32TYPE 0b00100110100000


#define FUNC7_0 0
#define FUNC7_32 32

typedef ap_int<XLEN> inst_type ;
typedef ap_uint<RF_PNTR_WIDTH> rf_pntr_type ;
typedef ap_uint<OPCODE_WIDTH> opcode_type ;
typedef ap_uint<FUNC3_WIDTH> func3_type ;
typedef ap_int<FUNC7_WIDTH> func7_type ;
typedef ap_int<XLEN> imm_type ;
typedef ap_int<XLEN> pc_type ;
typedef ap_int<XLEN> r_type ;
typedef ap_uint<XLEN> uns ;
typedef ap_int<XLEN> sgn;
typedef ap_uint<CTL_WIDTH> ctl_type ;
typedef ap_int<12> imm_12_type;
typedef ap_int<20> imm_20_type;



typedef struct {
	pc_type next_pc;
	ctl_type valid;
} hart_return_type;

typedef struct {
	r_type value;
	ctl_type valid;
} arith_type;

typedef struct {
	pc_type value;
	ctl_type valid;
} jump_type;



#define ADD 0
#define SUB 0
#define SLL 1
#define SLT 2
#define SLTU 3
#define XOR 4
#define SRL 5
#define SRA 5
#define OR 6
#define AND 7

#define ADDI 0
#define SLTI 2
#define SLTIU 3
#define XORI 4
#define ORI 6
#define ANDI 7
#define SLLI 1
#define SRI 5

#define BEQ 0
#define BNE 1
#define BLT 4
#define BGE 5
#define BLTU 6
#define BGEU 7s

hart_return_type hart(inst_type inst, pc_type pc);
arith_type OP_AL_32I(opcode_type opcode, func7_type func7, func3_type func3, r_type op1, r_type op2);
jump_type OP_AL_32B(imm_type imm, func3_type func3, r_type op1, r_type op2);
