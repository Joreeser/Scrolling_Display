`timescale 1ns / 1ps

module bram_test;
    logic [3:0] addra, addrb;
    logic clka, clkb, ena, enb, write_en;
    logic [15:0] data_in, data_out;
    
    oscillator clk_gen(clka);
    delay clock_delay(.a(clka), .a_delayed(clkb));
    BRAM_wrapper bram(addra, addrb, clka, clkb, data_in, data_out, ena, enb, write_en);
    
    initial
    begin
        addra = 0;
        addrb = 0;
        ena = 0; #1
        enb = 0;
        write_en = 0;
        data_in = 16'hAAAA; #10;
        ena = 1; #10;
        write_en = 1; #10;
        ena = 0; enb = 1; #10;
        addra = 1; addrb = 0; #10;
        addra = 2; addrb = 1; #10;
        addra = 2; addrb = 2; #10;
        addra = 2; addrb = 3; #10;
        $finish;
     end
endmodule
