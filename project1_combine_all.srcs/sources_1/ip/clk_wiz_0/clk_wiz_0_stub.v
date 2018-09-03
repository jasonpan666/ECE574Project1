// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Mon Oct 03 11:02:34 2016
// Host        : DESKTOP-OEAAL21 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/xuanyu/Desktop/project1_combine_all/project1_combine_all.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_fpga, clk_25MHz, reset, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_fpga,clk_25MHz,reset,locked" */;
  input clk_fpga;
  output clk_25MHz;
  input reset;
  output locked;
endmodule
