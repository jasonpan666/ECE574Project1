# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.cache/wt} [current_project]
set_property parent.project_path {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.xpr} [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_cache_permissions disable [current_project]
read_vhdl -library xil_defaultlib {
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/MMCM_clock.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/PmodALS.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/VGA_DISPLAY.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/clock_generate_1MHz.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/clock_generate_4Hz.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/clock_generate_500Hz.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/color_logic.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/data_convert.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/decimal_counter.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/light_sensor.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/position_convert.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/seven_segment_display.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/vga_controller_640_60.vhd}
  {D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/new/TOP_module.vhd}
}
read_ip -quiet {{D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci}}
set_property used_in_implementation false [get_files -all {{d:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc}}]
set_property used_in_implementation false [get_files -all {{d:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc}}]
set_property is_locked true [get_files {{D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/constrs_1/new/TOP_module.xdc}}
set_property used_in_implementation false [get_files {{D:/Study/USA Graduate/WPI Graduate 3/17 Fall Courses/ECE574 MODELING AND SYNTHESIS OF DIGITAL SYSTEMS USING VERILOG AND VHDL/Project 1/Zhenyu Pan_ECE574_Project1/project1_combine_all.srcs/constrs_1/new/TOP_module.xdc}}]


synth_design -top TOP_module -part xc7a100tcsg324-1


write_checkpoint -force -noxdef TOP_module.dcp

catch { report_utilization -file TOP_module_utilization_synth.rpt -pb TOP_module_utilization_synth.pb }
