//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
//Date        : Sun Oct 21 17:35:45 2018
//Host        : ROG-115-10 running 64-bit major release  (build 9200)
//Command     : generate_target bram_wrapper.bd
//Design      : bram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bram_wrapper
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

  wire [3:0]address_a;
  wire [5:0]address_b;
  wire clk_a;
  wire clk_b;
  wire [15:0]data_in;
  wire [3:0]data_out;
  wire en_a;
  wire en_b;
  wire write_en;

  bram bram_i
       (.address_a(address_a),
        .address_b(address_b),
        .clk_a(clk_a),
        .clk_b(clk_b),
        .data_in(data_in),
        .data_out(data_out),
        .en_a(en_a),
        .en_b(en_b),
        .write_en(write_en));
endmodule
