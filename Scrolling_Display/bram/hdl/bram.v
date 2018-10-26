//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
//Date        : Fri Oct 26 15:37:59 2018
//Host        : ROG-115-10 running 64-bit major release  (build 9200)
//Command     : generate_target bram.bd
//Design      : bram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bram.hwdef" *) 
module bram
   (address_a,
    address_b,
    clk_a,
    clk_b,
    data_in,
    data_out,
    en_a,
    en_b,
    write_en);
  input [3:0]address_a;
  input [5:0]address_b;
  input clk_a;
  input clk_b;
  input [15:0]data_in;
  output [3:0]data_out;
  input en_a;
  input en_b;
  input write_en;

  wire [3:0]address_a_1;
  wire [5:0]address_b_1;
  wire [3:0]blk_mem_gen_0_doutb;
  wire clk_a_1;
  wire clk_b_1;
  wire [15:0]data_in_1;
  wire en_a_1;
  wire en_b_1;
  wire write_en_1;

  assign address_a_1 = address_a[3:0];
  assign address_b_1 = address_b[5:0];
  assign clk_a_1 = clk_a;
  assign clk_b_1 = clk_b;
  assign data_in_1 = data_in[15:0];
  assign data_out[3:0] = blk_mem_gen_0_doutb;
  assign en_a_1 = en_a;
  assign en_b_1 = en_b;
  assign write_en_1 = write_en;
  bram_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(address_a_1),
        .addrb(address_b_1),
        .clka(clk_a_1),
        .clkb(clk_b_1),
        .dina(data_in_1),
        .doutb(blk_mem_gen_0_doutb),
        .ena(en_a_1),
        .enb(en_b_1),
        .wea(write_en_1));
endmodule
