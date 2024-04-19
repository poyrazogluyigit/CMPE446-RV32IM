set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {top_module} -view {{top_module_dataflow_ana.wcfg}} -tclbatch {top_module.tcl} -protoinst {top_module.protoinst}
