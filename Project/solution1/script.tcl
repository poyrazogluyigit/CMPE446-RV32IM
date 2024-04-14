############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project assignment
set_top hart
add_files OP_AL_32I.cpp
add_files OP_AL_B.cpp
add_files hart.cpp
add_files parameters.hpp
add_files -tb test_hart.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7vx550t-ffg1927-1}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level all -wave_debug
config_export -format ip_catalog -rtl verilog -vivado_clock 10
source "./assignment/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -wave_debug -trace_level all
export_design -flow syn -rtl verilog -format ip_catalog
