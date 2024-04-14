// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hart_hart,hls_ip_2023_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7vx550t-ffg1927-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.659444,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=194,HLS_SYN_LUT=1678,HLS_VERSION=2023_2}" *)

module hart (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inst,
        pc,
        ap_return
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] inst;
input  [31:0] pc;
output  [63:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] rf_address0;
reg    rf_ce0;
reg    rf_we0;
reg   [31:0] rf_d0;
wire   [31:0] rf_q0;
reg   [4:0] rf_address1;
reg    rf_ce1;
reg    rf_we1;
reg   [31:0] rf_d1;
wire   [31:0] rf_q1;
wire   [6:0] opcode_fu_227_p1;
reg   [6:0] opcode_reg_388;
wire   [4:0] rd_fu_231_p4;
reg   [4:0] rd_reg_393;
wire   [2:0] func3_fu_261_p4;
reg   [2:0] func3_reg_398;
reg   [6:0] func7_reg_403;
reg   [31:0] rf_load_reg_421;
wire    ap_CS_fsm_state2;
reg   [31:0] rf_load_1_reg_426;
wire    ap_CS_fsm_state4;
wire    grp_OP_AL_32I_fu_211_ap_start;
wire    grp_OP_AL_32I_fu_211_ap_done;
wire    grp_OP_AL_32I_fu_211_ap_idle;
wire    grp_OP_AL_32I_fu_211_ap_ready;
wire   [31:0] grp_OP_AL_32I_fu_211_ap_return_0;
wire   [0:0] grp_OP_AL_32I_fu_211_ap_return_1;
reg   [0:0] status_1_reg_169;
reg    ap_predicate_op61_call_state4;
reg    ap_block_state4_on_subcall_done;
wire   [0:0] icmp_ln41_fu_295_p2;
reg    grp_OP_AL_32I_fu_211_ap_start_reg;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln46_fu_301_p1;
wire   [63:0] zext_ln40_fu_306_p1;
wire   [63:0] zext_ln39_fu_324_p1;
wire   [63:0] zext_ln38_fu_338_p1;
wire   [63:0] zext_ln49_fu_343_p1;
wire   [63:0] zext_ln49_1_fu_348_p1;
wire   [63:0] zext_ln49_2_fu_362_p1;
wire   [31:0] grp_fu_220_p2;
wire   [31:0] shl_ln39_fu_317_p2;
wire   [31:0] shl_ln_fu_329_p3;
wire    ap_CS_fsm_state5;
wire  signed [19:0] imm_31_12_fu_281_p4;
wire  signed [31:0] sext_ln29_fu_291_p1;
wire   [31:0] add_ln39_fu_311_p2;
wire   [4:0] rs1_fu_241_p4;
wire   [4:0] rs2_fu_251_p4;
wire   [31:0] next_pc_fu_366_p2;
wire   [32:0] tmp_1_fu_371_p3;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_condition_203;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_OP_AL_32I_fu_211_ap_start_reg = 1'b0;
end

hart_rf_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
rf_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(rf_address0),
    .ce0(rf_ce0),
    .we0(rf_we0),
    .d0(rf_d0),
    .q0(rf_q0),
    .address1(rf_address1),
    .ce1(rf_ce1),
    .we1(rf_we1),
    .d1(rf_d1),
    .q1(rf_q1)
);

hart_OP_AL_32I grp_OP_AL_32I_fu_211(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_OP_AL_32I_fu_211_ap_start),
    .ap_done(grp_OP_AL_32I_fu_211_ap_done),
    .ap_idle(grp_OP_AL_32I_fu_211_ap_idle),
    .ap_ready(grp_OP_AL_32I_fu_211_ap_ready),
    .opcode_val(opcode_reg_388),
    .func7_val(func7_reg_403),
    .func3_val(func3_reg_398),
    .op1_val(rf_load_reg_421),
    .op2_val(rf_load_1_reg_426),
    .ap_return_0(grp_OP_AL_32I_fu_211_ap_return_0),
    .ap_return_1(grp_OP_AL_32I_fu_211_ap_return_1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_OP_AL_32I_fu_211_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_OP_AL_32I_fu_211_ap_start_reg <= 1'b1;
        end else if ((grp_OP_AL_32I_fu_211_ap_ready == 1'b1)) begin
            grp_OP_AL_32I_fu_211_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((~(func3_fu_261_p4 == 3'd6) & ~(func3_fu_261_p4 == 3'd5) & ~(func3_fu_261_p4 == 3'd4) & ~(func3_fu_261_p4 == 3'd1) & ~(func3_fu_261_p4 == 3'd0) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln41_fu_295_p2 == 1'd0) & (ap_start == 1'b1)))) begin
        status_1_reg_169 <= 1'd1;
    end else if ((((func3_fu_261_p4 == 3'd6) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((func3_fu_261_p4 == 3'd5) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((func3_fu_261_p4 == 3'd4) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((func3_fu_261_p4 == 3'd1) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((func3_fu_261_p4 == 3'd0) & (opcode_fu_227_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln41_fu_295_p2 == 1'd1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd55) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd23) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        status_1_reg_169 <= 1'd0;
    end else if ((~(opcode_reg_388 == 7'd111) & ~(opcode_reg_388 == 7'd23) & ~(opcode_reg_388 == 7'd55) & ~(opcode_reg_388 == 7'd99) & ~(opcode_reg_388 == 7'd103) & (1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        status_1_reg_169 <= grp_OP_AL_32I_fu_211_ap_return_1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        func3_reg_398 <= {{inst[14:12]}};
        func7_reg_403 <= {{inst[31:25]}};
        opcode_reg_388 <= opcode_fu_227_p1;
        rd_reg_393 <= {{inst[11:7]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        rf_load_1_reg_426 <= rf_q0;
        rf_load_reg_421 <= rf_q1;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state4_on_subcall_done)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((1'b1 == ap_condition_203)) begin
            rf_address0 = zext_ln49_1_fu_348_p1;
        end else if ((opcode_fu_227_p1 == 7'd55)) begin
            rf_address0 = zext_ln38_fu_338_p1;
        end else if ((opcode_fu_227_p1 == 7'd23)) begin
            rf_address0 = zext_ln39_fu_324_p1;
        end else if ((opcode_fu_227_p1 == 7'd111)) begin
            rf_address0 = zext_ln40_fu_306_p1;
        end else if (((opcode_fu_227_p1 == 7'd103) & (icmp_ln41_fu_295_p2 == 1'd1))) begin
            rf_address0 = zext_ln46_fu_301_p1;
        end else begin
            rf_address0 = 'bx;
        end
    end else begin
        rf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        rf_address1 = 5'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        rf_address1 = zext_ln49_2_fu_362_p1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        rf_address1 = zext_ln49_fu_343_p1;
    end else begin
        rf_address1 = 'bx;
    end
end

always @ (*) begin
    if (((~(opcode_fu_227_p1 == 7'd99) & ~(opcode_fu_227_p1 == 7'd103) & ~(opcode_fu_227_p1 == 7'd55) & ~(opcode_fu_227_p1 == 7'd23) & ~(opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln41_fu_295_p2 == 1'd1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd55) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd23) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        rf_ce0 = 1'b1;
    end else begin
        rf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        rf_ce1 = 1'b1;
    end else begin
        rf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((opcode_fu_227_p1 == 7'd55) & (1'b1 == ap_CS_fsm_state1))) begin
        rf_d0 = shl_ln_fu_329_p3;
    end else if (((opcode_fu_227_p1 == 7'd23) & (1'b1 == ap_CS_fsm_state1))) begin
        rf_d0 = shl_ln39_fu_317_p2;
    end else if ((((opcode_fu_227_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln41_fu_295_p2 == 1'd1)) | ((opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1)))) begin
        rf_d0 = grp_fu_220_p2;
    end else begin
        rf_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        rf_d1 = 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        rf_d1 = grp_OP_AL_32I_fu_211_ap_return_0;
    end else begin
        rf_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((opcode_fu_227_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln41_fu_295_p2 == 1'd1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd55) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd23) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        rf_we0 = 1'b1;
    end else begin
        rf_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (~(opcode_reg_388 == 7'd111) & ~(opcode_reg_388 == 7'd23) & ~(opcode_reg_388 == 7'd55) & ~(opcode_reg_388 == 7'd99) & ~(opcode_reg_388 == 7'd103) & (1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done)))) begin
        rf_we1 = 1'b1;
    end else begin
        rf_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((opcode_fu_227_p1 == 7'd99) | ((opcode_fu_227_p1 == 7'd55) | ((opcode_fu_227_p1 == 7'd23) | ((opcode_fu_227_p1 == 7'd111) | (opcode_fu_227_p1 == 7'd103))))))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if ((~(opcode_fu_227_p1 == 7'd99) & ~(opcode_fu_227_p1 == 7'd103) & ~(opcode_fu_227_p1 == 7'd55) & ~(opcode_fu_227_p1 == 7'd23) & ~(opcode_fu_227_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln39_fu_311_p2 = (pc + 32'd12);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state4_on_subcall_done = ((grp_OP_AL_32I_fu_211_ap_done == 1'b0) & (ap_predicate_op61_call_state4 == 1'b1));
end

always @ (*) begin
    ap_condition_203 = (~(opcode_fu_227_p1 == 7'd99) & ~(opcode_fu_227_p1 == 7'd103) & ~(opcode_fu_227_p1 == 7'd55) & ~(opcode_fu_227_p1 == 7'd23) & ~(opcode_fu_227_p1 == 7'd111));
end

always @ (*) begin
    ap_predicate_op61_call_state4 = (~(opcode_reg_388 == 7'd111) & ~(opcode_reg_388 == 7'd23) & ~(opcode_reg_388 == 7'd55) & ~(opcode_reg_388 == 7'd99) & ~(opcode_reg_388 == 7'd103));
end

assign ap_return = tmp_1_fu_371_p3;

assign func3_fu_261_p4 = {{inst[14:12]}};

assign grp_OP_AL_32I_fu_211_ap_start = grp_OP_AL_32I_fu_211_ap_start_reg;

assign grp_fu_220_p2 = (pc + 32'd4);

assign icmp_ln41_fu_295_p2 = ((func3_fu_261_p4 == 3'd0) ? 1'b1 : 1'b0);

assign imm_31_12_fu_281_p4 = {{inst[31:12]}};

assign next_pc_fu_366_p2 = (pc + 32'd4);

assign opcode_fu_227_p1 = inst[6:0];

assign rd_fu_231_p4 = {{inst[11:7]}};

assign rs1_fu_241_p4 = {{inst[19:15]}};

assign rs2_fu_251_p4 = {{inst[24:20]}};

assign sext_ln29_fu_291_p1 = imm_31_12_fu_281_p4;

assign shl_ln39_fu_317_p2 = sext_ln29_fu_291_p1 << add_ln39_fu_311_p2;

assign shl_ln_fu_329_p3 = {{imm_31_12_fu_281_p4}, {12'd0}};

assign tmp_1_fu_371_p3 = {{status_1_reg_169}, {next_pc_fu_366_p2}};

assign zext_ln38_fu_338_p1 = rd_fu_231_p4;

assign zext_ln39_fu_324_p1 = rd_fu_231_p4;

assign zext_ln40_fu_306_p1 = rd_fu_231_p4;

assign zext_ln46_fu_301_p1 = rd_fu_231_p4;

assign zext_ln49_1_fu_348_p1 = rs2_fu_251_p4;

assign zext_ln49_2_fu_362_p1 = rd_reg_393;

assign zext_ln49_fu_343_p1 = rs1_fu_241_p4;

endmodule //hart
