
set PATH=
call D:/Xilinx/Vivado/2023.2/bin/xelab xil_defaultlib.apatb_top_module_top glbl -Oenable_linking_all_libraries  -prj top_module.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_1_16 -L floating_point_v7_0_21 --lib "ieee_proposed=./ieee_proposed" -s top_module -debug all
call D:/Xilinx/Vivado/2023.2/bin/xsim --noieeewarnings top_module -tclbatch top_module.tcl -gui -view top_module_dataflow_ana.wcfg -protoinst top_module.protoinst

