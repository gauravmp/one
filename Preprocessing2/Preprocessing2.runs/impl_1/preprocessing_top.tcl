proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z020clg484-1
  set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {E:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.cache/wt} [current_project]
  set_property parent.project_path {E:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.xpr} [current_project]
  set_property ip_repo_paths {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.cache/ip}} [current_project]
  set_property ip_output_repo {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.cache/ip}} [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet {{E:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.runs/synth_1/preprocessing_top.dcp}}
  add_files -quiet {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1.dcp}}
  set_property netlist_only true [get_files {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1.dcp}}]
  read_xdc -mode out_of_context -ref pll1 -cells inst {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_ooc.xdc}}
  set_property processing_order EARLY [get_files {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_ooc.xdc}}]
  read_xdc -prop_thru_buffers -ref pll1 -cells inst {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_board.xdc}}
  set_property processing_order EARLY [get_files {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_board.xdc}}]
  read_xdc -ref pll1 -cells inst {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1.xdc}}
  set_property processing_order EARLY [get_files {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1.xdc}}]
  read_xdc {{E:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/constrs_1/imports/zedboard_master_XDC_RevC_D_v2/zedboard_master_XDC_RevC_D_v2.xdc}}
  read_xdc -ref pll1 -cells inst {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_late.xdc}}
  set_property processing_order LATE [get_files {{e:/HASP/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_late.xdc}}]
  link_design -top preprocessing_top -part xc7z020clg484-1
  write_hwdef -file preprocessing_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force preprocessing_top_opt.dcp
  report_drc -file preprocessing_top_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force preprocessing_top_placed.dcp
  report_io -file preprocessing_top_io_placed.rpt
  report_utilization -file preprocessing_top_utilization_placed.rpt -pb preprocessing_top_utilization_placed.pb
  report_control_sets -verbose -file preprocessing_top_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force preprocessing_top_routed.dcp
  report_drc -file preprocessing_top_drc_routed.rpt -pb preprocessing_top_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file preprocessing_top_timing_summary_routed.rpt -rpx preprocessing_top_timing_summary_routed.rpx
  report_power -file preprocessing_top_power_routed.rpt -pb preprocessing_top_power_summary_routed.pb -rpx preprocessing_top_power_routed.rpx
  report_route_status -file preprocessing_top_route_status.rpt -pb preprocessing_top_route_status.pb
  report_clock_utilization -file preprocessing_top_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

