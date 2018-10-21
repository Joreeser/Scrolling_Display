`timescale 1ns / 1ps

module bram_test;
    logic [3:0] addra;
    logic [5:0] addrb;
    logic clka, clkb, ena, enb, write_en, reset, tick;
    logic [15:0] data_in;
    logic [3:0] data_out;
    logic [31:0] disp;
    
    oscillator clk_gen(clka);
    delay clock_delay(.a(clka), .a_delayed(clkb));
    bram_wrapper bram1(addra, addrb, clka, clkb, data_in, data_out, ena, enb, write_en);
    mod_m_counter#(.M(2)) mem_out_delay(.clk(clkb), .reset(reset), .max_tick(tick), .q());
    univ_shift_reg#(.N(32)) shift(.clk(tick), .reset(reset), .ctrl(2'b10), .d(data_out), .q(disp));
    counter#(.SIZE(6)) mem_out_count(.clk(tick), .reset(reset), .count(addrb));
    
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
