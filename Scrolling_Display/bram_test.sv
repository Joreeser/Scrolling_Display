`timescale 1ns / 1ps

module bram_test;
    logic [3:0] addra;
    logic [5:0] addrb;
    logic clka, clkb, ena, enb, write_en, reset, tick;
    logic [15:0] data_in;
    logic [3:0] data_out;
    logic [31:0] disp;
    logic [63:0] hex;
    logic [7:0] an, sseg;
    
    oscillator clk_gen(clka);
    delay clock_delay(.a(clka), .a_delayed(clkb));
    bram_wrapper bram1(addra, addrb, clka, clkb, data_in, data_out, ena, enb, write_en);
    mod_m_counter#(.M(2)) mem_out_delay(.clk(clkb), .reset(reset), .max_tick(tick), .q());
    univ_shift_reg#(.N(32)) shift(.clk(tick), .reset(reset), .ctrl(2'b10), .d(data_out), .q(disp));
    counter#(.SIZE(6)) mem_out_count(.clk(tick), .reset(reset), .count(addrb));
    hex_to_sseg display_val0(.hex(disp[3:0]), .dp(0), .sseg(hex[7:0]));
    hex_to_sseg display_val1(.hex(disp[7:4]), .dp(0), .sseg(hex[15:8]));
    hex_to_sseg display_val2(.hex(disp[11:8]), .dp(0), .sseg(hex[23:16]));
    hex_to_sseg display_val3(.hex(disp[15:12]), .dp(0), .sseg(hex[31:24]));
    hex_to_sseg display_val4(.hex(disp[19:16]), .dp(0), .sseg(hex[39:32]));
    hex_to_sseg display_val5(.hex(disp[23:20]), .dp(0), .sseg(hex[47:40]));
    hex_to_sseg display_val6(.hex(disp[27:24]), .dp(0), .sseg(hex[55:48]));
    hex_to_sseg display_val7(.hex(disp[31:28]), .dp(0), .sseg(hex[63:56]));
    disp_mux display(.clk(clka), .reset(reset), .in0(hex[7:0]), .in1(hex[15:8]), 
        .in2(hex[23:16]), .in3(hex[31:24]), .in4(hex[39:32]), .in5(hex[47:40]), .in6(hex[55:48]), .in7(hex[63:56]), .an(an), .sseg(sseg));
    
    //always_ff @(posedge tick, posedge reset)
        //if (reset)
            //addrb = 0;
        //else 
            //addrb++;
    
    initial
    begin
        ena = 1; enb = 1; write_en = 0;
        reset = 1; #10;
        reset = 0; #20;
        addra = 4'b0001; data_in = 16'h1234; write_en = 1; #20;
        write_en = 0; #10;
        addra = 4'b0010; data_in = 16'hABCD; write_en = 1; #20;
        write_en = 0; #10;
        #500;
        $finish;
     end
endmodule
