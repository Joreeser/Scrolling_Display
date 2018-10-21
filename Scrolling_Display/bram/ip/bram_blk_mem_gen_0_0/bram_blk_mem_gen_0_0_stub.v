// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Sun Oct 21 17:37:17 2018
// Host        : ROG-115-10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               H:/SoC_Labs/scrolling_display/Scrolling_Display/bram/ip/bram_blk_mem_gen_0_0/bram_blk_mem_gen_0_0_stub.v
// Design      : bram_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_6,Vivado 2017.2.1" *)
module bram_blk_mem_gen_0_0(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[3:0],dina[15:0],clkb,enb,addrb[5:0],doutb[3:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [3:0]addra;
  input [15:0]dina;
  input clkb;
  input enb;
  input [5:0]addrb;
  output [3:0]doutb;
endmodule
