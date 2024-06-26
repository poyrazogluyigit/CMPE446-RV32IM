// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module top_module_OP_AL_32I (
        ap_ready,
        inst_val,
        func7_val,
        func3_val,
        op1_val,
        op2_val,
        ap_return_0,
        ap_return_1
);


output   ap_ready;
input  [31:0] inst_val;
input  [6:0] func7_val;
input  [2:0] func3_val;
input  [31:0] op1_val;
input  [31:0] op2_val;
output  [31:0] ap_return_0;
output  [0:0] ap_return_1;

wire   [31:0] shl_ln38_fu_464_p2;
reg   [31:0] ap_phi_mux_tmp57_0_phi_fu_101_p4;
wire   [6:0] opcode_fu_309_p1;
wire   [2:0] func3_val_read_read_fu_80_p2;
wire   [6:0] func7_val_read_read_fu_86_p2;
wire   [0:0] grp_fu_267_p3;
wire   [0:0] grp_fu_275_p3;
wire   [31:0] ashr_ln38_fu_457_p2;
reg   [31:0] ap_phi_mux_rd_val_15_phi_fu_110_p58;
wire   [31:0] rd_val_13_fu_444_p2;
wire   [31:0] ashr_ln70_fu_437_p2;
wire   [31:0] shr_i4_fu_430_p2;
wire   [31:0] zext_ln7_fu_360_p1;
wire   [31:0] rd_val_4_fu_381_p3;
wire   [31:0] rd_val_3_fu_390_p2;
wire   [31:0] zext_ln54_fu_403_p1;
wire   [31:0] zext_ln53_fu_414_p1;
wire   [31:0] rd_val_fu_419_p2;
wire   [31:0] rd_val_14_fu_347_p2;
wire   [0:0] icmp_ln59_fu_337_p2;
wire   [31:0] rd_val_6_fu_542_p2;
wire   [31:0] rd_val_12_fu_478_p2;
wire   [31:0] grp_fu_297_p2;
wire   [31:0] grp_fu_283_p2;
wire   [31:0] rd_val_11_fu_485_p2;
wire   [31:0] rd_val_10_fu_492_p2;
wire   [31:0] zext_ln25_fu_505_p1;
wire   [31:0] zext_ln24_fu_516_p1;
wire   [31:0] rd_val_7_fu_535_p2;
wire   [31:0] ashr_ln23_fu_528_p2;
wire   [31:0] shl_ln23_fu_521_p2;
wire   [31:0] xor_ln38_1_fu_471_p2;
reg   [0:0] ap_phi_mux_valid_phi_fu_178_p58;
wire   [31:0] grp_fu_291_p2;
wire   [11:0] immediate_fu_313_p4;
wire   [5:0] shamt_fu_327_p4;
wire   [31:0] zext_ln59_fu_343_p1;
wire   [11:0] trunc_ln10_fu_305_p1;
wire   [11:0] rd_val_5_fu_354_p2;
wire   [19:0] tmp_7_fu_371_p4;
wire   [11:0] or_ln56_fu_365_p2;
wire   [31:0] zext_ln13_fu_323_p1;
wire   [0:0] rd_val_2_fu_397_p2;
wire   [0:0] rd_val_1_fu_408_p2;
wire   [31:0] zext_ln70_fu_426_p1;
wire   [31:0] xor_ln38_fu_451_p2;
wire   [0:0] rd_val_9_fu_499_p2;
wire   [0:0] rd_val_8_fu_510_p2;
reg    ap_condition_30;
wire    ap_ce_reg;

always @ (*) begin
    if (((grp_fu_267_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = xor_ln38_1_fu_471_p2;
    end else if (((grp_fu_275_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = shl_ln23_fu_521_p2;
    end else if (((grp_fu_275_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = ashr_ln23_fu_528_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_7_fu_535_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd2) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = zext_ln24_fu_516_p1;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd3) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = zext_ln25_fu_505_p1;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd4) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_10_fu_492_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd6) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_11_fu_485_p2;
    end else if ((((grp_fu_275_p3 == 1'd0) & (grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = grp_fu_283_p2;
    end else if ((((grp_fu_275_p3 == 1'd1) & (grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = grp_fu_297_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_12_fu_478_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd7) & (opcode_fu_309_p1 == 7'd51))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_6_fu_542_p2;
    end else if (((icmp_ln59_fu_337_p2 == 1'd1) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_14_fu_347_p2;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_fu_419_p2;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd2) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = zext_ln53_fu_414_p1;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd3) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = zext_ln54_fu_403_p1;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd4) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_3_fu_390_p2;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd6) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_4_fu_381_p3;
    end else if (((func3_val_read_read_fu_80_p2 == 3'd7) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = zext_ln7_fu_360_p1;
    end else if (((grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = shr_i4_fu_430_p2;
    end else if (((grp_fu_267_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = ashr_ln70_fu_437_p2;
    end else if (((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = rd_val_13_fu_444_p2;
    end else if (((~(func3_val_read_read_fu_80_p2 == 3'd0) & ~(func3_val_read_read_fu_80_p2 == 3'd5) & (func7_val_read_read_fu_86_p2 == 7'd32) & (opcode_fu_309_p1 == 7'd51)) | (~(func7_val_read_read_fu_86_p2 == 7'd0) & ~(func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19)) | (~(func7_val_read_read_fu_86_p2 == 7'd0) & ~(func7_val_read_read_fu_86_p2 == 7'd32) & (opcode_fu_309_p1 == 7'd51)) | (~(opcode_fu_309_p1 == 7'd19) & ~(opcode_fu_309_p1 == 7'd51)) | ((icmp_ln59_fu_337_p2 == 1'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd19)))) begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = 32'd0;
    end else begin
        ap_phi_mux_rd_val_15_phi_fu_110_p58 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_30)) begin
        if ((grp_fu_275_p3 == 1'd0)) begin
            ap_phi_mux_tmp57_0_phi_fu_101_p4 = ashr_ln38_fu_457_p2;
        end else if ((grp_fu_275_p3 == 1'd1)) begin
            ap_phi_mux_tmp57_0_phi_fu_101_p4 = shl_ln38_fu_464_p2;
        end else begin
            ap_phi_mux_tmp57_0_phi_fu_101_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_tmp57_0_phi_fu_101_p4 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln59_fu_337_p2 == 1'd1) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd2) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd3) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd4) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd6) & (opcode_fu_309_p1 == 7'd19)) | ((func3_val_read_read_fu_80_p2 == 3'd7) & (opcode_fu_309_p1 == 7'd19)) | ((grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd2) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd3) & (opcode_fu_309_p1 == 7'd51)) 
    | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd4) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd6) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd7) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19)) | ((grp_fu_275_p3 == 1'd0) & (grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd1) & (grp_fu_267_p3 == 1'd0) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 
    == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_275_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd0) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((grp_fu_267_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19)) | ((grp_fu_267_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51)) | ((func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd0) & (opcode_fu_309_p1 == 7'd51)))) begin
        ap_phi_mux_valid_phi_fu_178_p58 = 1'd1;
    end else if (((~(func3_val_read_read_fu_80_p2 == 3'd0) & ~(func3_val_read_read_fu_80_p2 == 3'd5) & (func7_val_read_read_fu_86_p2 == 7'd32) & (opcode_fu_309_p1 == 7'd51)) | (~(func7_val_read_read_fu_86_p2 == 7'd0) & ~(func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd19)) | (~(func7_val_read_read_fu_86_p2 == 7'd0) & ~(func7_val_read_read_fu_86_p2 == 7'd32) & (opcode_fu_309_p1 == 7'd51)) | (~(opcode_fu_309_p1 == 7'd19) & ~(opcode_fu_309_p1 == 7'd51)) | ((icmp_ln59_fu_337_p2 == 1'd0) & (func3_val_read_read_fu_80_p2 == 3'd1) & (opcode_fu_309_p1 == 7'd19)))) begin
        ap_phi_mux_valid_phi_fu_178_p58 = 1'd0;
    end else begin
        ap_phi_mux_valid_phi_fu_178_p58 = 'bx;
    end
end

always @ (*) begin
    ap_condition_30 = ((grp_fu_267_p3 == 1'd1) & (func7_val_read_read_fu_86_p2 == 7'd32) & (func3_val_read_read_fu_80_p2 == 3'd5) & (opcode_fu_309_p1 == 7'd51));
end

assign ap_ready = 1'b1;

assign ashr_ln23_fu_528_p2 = $signed(op1_val) >>> grp_fu_291_p2;

assign ashr_ln38_fu_457_p2 = $signed(xor_ln38_fu_451_p2) >>> op2_val;

assign ashr_ln70_fu_437_p2 = $signed(op1_val) >>> zext_ln70_fu_426_p1;

assign grp_fu_267_p3 = op1_val[32'd31];

assign grp_fu_275_p3 = op2_val[32'd31];

assign grp_fu_283_p2 = op1_val >> op2_val;

assign grp_fu_291_p2 = (32'd0 - op2_val);

assign grp_fu_297_p2 = op1_val << grp_fu_291_p2;

assign icmp_ln59_fu_337_p2 = ((func7_val == 7'd0) ? 1'b1 : 1'b0);

assign immediate_fu_313_p4 = {{inst_val[31:20]}};

assign opcode_fu_309_p1 = inst_val[6:0];

assign or_ln56_fu_365_p2 = (trunc_ln10_fu_305_p1 | immediate_fu_313_p4);

assign rd_val_10_fu_492_p2 = (op2_val ^ op1_val);

assign rd_val_11_fu_485_p2 = (op2_val | op1_val);

assign rd_val_12_fu_478_p2 = (op1_val - op2_val);

assign rd_val_13_fu_444_p2 = op1_val >> zext_ln13_fu_323_p1;

assign rd_val_14_fu_347_p2 = op1_val << zext_ln59_fu_343_p1;

assign rd_val_1_fu_408_p2 = (($signed(zext_ln13_fu_323_p1) > $signed(op1_val)) ? 1'b1 : 1'b0);

assign rd_val_2_fu_397_p2 = ((zext_ln13_fu_323_p1 > op1_val) ? 1'b1 : 1'b0);

assign rd_val_3_fu_390_p2 = (zext_ln13_fu_323_p1 ^ op1_val);

assign rd_val_4_fu_381_p3 = {{tmp_7_fu_371_p4}, {or_ln56_fu_365_p2}};

assign rd_val_5_fu_354_p2 = (trunc_ln10_fu_305_p1 & immediate_fu_313_p4);

assign rd_val_6_fu_542_p2 = (op2_val & op1_val);

assign rd_val_7_fu_535_p2 = (op2_val + op1_val);

assign rd_val_8_fu_510_p2 = (($signed(op1_val) < $signed(op2_val)) ? 1'b1 : 1'b0);

assign rd_val_9_fu_499_p2 = ((op1_val < op2_val) ? 1'b1 : 1'b0);

assign rd_val_fu_419_p2 = (zext_ln13_fu_323_p1 + op1_val);

assign shamt_fu_327_p4 = {{inst_val[25:20]}};

assign shl_ln23_fu_521_p2 = op1_val << op2_val;

assign shl_ln38_fu_464_p2 = xor_ln38_fu_451_p2 << grp_fu_291_p2;

assign shr_i4_fu_430_p2 = op1_val >> zext_ln70_fu_426_p1;

assign tmp_7_fu_371_p4 = {{op1_val[31:12]}};

assign trunc_ln10_fu_305_p1 = op1_val[11:0];

assign xor_ln38_1_fu_471_p2 = (ap_phi_mux_tmp57_0_phi_fu_101_p4 ^ 32'd4294967295);

assign xor_ln38_fu_451_p2 = (op1_val ^ 32'd4294967295);

assign zext_ln13_fu_323_p1 = immediate_fu_313_p4;

assign zext_ln24_fu_516_p1 = rd_val_8_fu_510_p2;

assign zext_ln25_fu_505_p1 = rd_val_9_fu_499_p2;

assign zext_ln53_fu_414_p1 = rd_val_1_fu_408_p2;

assign zext_ln54_fu_403_p1 = rd_val_2_fu_397_p2;

assign zext_ln59_fu_343_p1 = shamt_fu_327_p4;

assign zext_ln70_fu_426_p1 = shamt_fu_327_p4;

assign zext_ln7_fu_360_p1 = rd_val_5_fu_354_p2;

assign ap_return_0 = ap_phi_mux_rd_val_15_phi_fu_110_p58;

assign ap_return_1 = ap_phi_mux_valid_phi_fu_178_p58;

assign func3_val_read_read_fu_80_p2 = func3_val;

assign func7_val_read_read_fu_86_p2 = func7_val;

endmodule //top_module_OP_AL_32I
