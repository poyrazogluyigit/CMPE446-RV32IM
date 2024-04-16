set moduleName hart
set isTopModule 0
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {hart}
set C_modelType { int 65 }
set C_modelArgList {
	{ inst int 32 regular  }
	{ pc int 32 regular  }
	{ op1 int 32 regular  }
	{ op2 int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inst", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pc", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "op1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "op2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 65} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inst sc_in sc_lv 32 signal 0 } 
	{ pc sc_in sc_lv 32 signal 1 } 
	{ op1 sc_in sc_lv 32 signal 2 } 
	{ op2 sc_in sc_lv 32 signal 3 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
	{ ap_return_2 sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inst", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inst", "role": "default" }} , 
 	{ "name": "pc", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pc", "role": "default" }} , 
 	{ "name": "op1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "op1", "role": "default" }} , 
 	{ "name": "op2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "op2", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "hart",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "inst", "Type" : "None", "Direction" : "I"},
			{"Name" : "pc", "Type" : "None", "Direction" : "I"},
			{"Name" : "op1", "Type" : "None", "Direction" : "I"},
			{"Name" : "op2", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret_OP_AL_32I_fu_229", "Parent" : "0",
		"CDFG" : "OP_AL_32I",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "opcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "func7", "Type" : "None", "Direction" : "I"},
			{"Name" : "func3", "Type" : "None", "Direction" : "I"},
			{"Name" : "op1", "Type" : "None", "Direction" : "I"},
			{"Name" : "op2", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	hart {
		inst {Type I LastRead 0 FirstWrite -1}
		pc {Type I LastRead 0 FirstWrite -1}
		op1 {Type I LastRead 0 FirstWrite -1}
		op2 {Type I LastRead 0 FirstWrite -1}}
	OP_AL_32I {
		opcode {Type I LastRead 0 FirstWrite -1}
		func7 {Type I LastRead 0 FirstWrite -1}
		func3 {Type I LastRead 0 FirstWrite -1}
		op1 {Type I LastRead 0 FirstWrite -1}
		op2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inst { ap_none {  { inst in_data 0 32 } } }
	pc { ap_none {  { pc in_data 0 32 } } }
	op1 { ap_none {  { op1 in_data 0 32 } } }
	op2 { ap_none {  { op2 in_data 0 32 } } }
}
