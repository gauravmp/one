set_property SRC_FILE_INFO {cfile:{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1.xdc} rfile:../../../Preprocessing2.srcs/sources_1/ip/pll1/pll1.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
