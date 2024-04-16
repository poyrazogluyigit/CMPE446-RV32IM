set moduleName OP_AL_32I
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
set C_modelName {OP_AL_32I}
set C_modelType { int 33 }
set C_modelArgList {
	{ opcode int 7 regular  }
	{ func7 int 7 regular  }
	{ func3 int 3 regular  }
	{ op1 int 32 regular  }
	{ op2 int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "opcode", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "func7", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "func3", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "op1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "op2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 33} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ opcode sc_in sc_lv 7 signal 0 } 
	{ func7 sc_in sc_lv 7 signal 1 } 
	{ func3 sc_in sc_lv 3 signal 2 } 
	{ op1 sc_in sc_lv 32 signal 3 } 
	{ op2 sc_in sc_lv 32 signal 4 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "opcode", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "opcode", "role": "default" }} , 
 	{ "name": "func7", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "func7", "role": "default" }} , 
 	{ "name": "func3", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "func3", "role": "default" }} , 
 	{ "name": "op1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "op1", "role": "default" }} , 
 	{ "name": "op2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "op2", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
	opcode { ap_none {  { opcode in_data 0 7 } } }
	func7 { ap_none {  { func7 in_data 0 7 } } }
	func3 { ap_none {  { func3 in_data 0 3 } } }
	op1 { ap_none {  { op1 in_data 0 32 } } }
	op2 { ap_none {  { op2 in_data 0 32 } } }
}
