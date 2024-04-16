############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Project
set_top top_module
add_files top_module.cpp
add_files parameters.hpp
add_files hazard_detector.cpp
add_files hart.cpp
add_files OP_AL_B.cpp
add_files OP_AL_32I.cpp
add_files -tb test_hart.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvf1517-3-e}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level all -wave_debug
config_export -format ip_catalog -rtl verilog -vivado_clock 10
source "./Project/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -wave_debug -trace_level all
export_design -flow syn -rtl verilog -format ip_catalog
