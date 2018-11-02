`timescale 1ns / 1ps

module scrolling_display(
    input logic [15:0] sw,
    input logic clk, reset, enter_btn, prog,
    output logic [7:0] an, sseg,
    output logic [15:0] led);
    
    logic [3:0] addra;
    logic [5:0] addrb;
    logic ena, enb, write_en, tick, enter;
    logic [15:0] data_in;
    logic [3:0] data_out;
    logic [31:0] disp_val;
    logic [63:0] hex;
    
    // Initialize state definitions   
    typedef enum {DEF_DISP, DISPLAY, PROG} scrolling_states;
    scrolling_states state, next_state;
    
    always_ff @(posedge clk, posedge reset)
        if (reset)
            state <= DEF_DISP;
        else
            state <= next_state;
    
    // State logic        
    always_comb
    begin        
        case (state)
        DEF_DISP:
        begin 
            ena = 1;
            enb = 1;
            write_en = 0;
            led = 16'b0;           
            if(prog)
                next_state = PROG;
            else
                next_state = DEF_DISP;    
        end
        
        PROG:
        begin
            data_in = sw;
            led = 16'hFFFF;
            
            if(enter)
            begin
                write_en = 1'b1;
                next_state = DISPLAY;
            end
            else
                next_state = PROG;
        end
        
        DISPLAY:
        begin 
            write_en = 0;
            led = 16'b0;
                       
            if (reset)
                next_state = DEF_DISP;
            else if(prog)
                next_state = PROG;
            else
                next_state = DISPLAY;
        end
        endcase
    end
    
    // BRAM instantiation
    bram_wrapper bram1(
        addra, 
        addrb, 
        clk, 
        clk, 
        data_in, 
        data_out, 
        ena, 
        enb, 
        write_en);
    
    // Button debouncer for enter button
    debounce debounce_sd(
        .clk(clk), 
        .reset(reset), 
        .sw(enter_btn), 
        .db_level(enter), 
        .db_tick());
    
    // Create tick every second for shift reg
    mod_m_counter#(.M(100000000)) mem_out_delay(
        .clk(clk), 
        .reset(reset), 
        .max_tick(tick), 
        .q());
    
    // Shift BRAM output for scrolling display   
    univ_shift_reg#(.N(32)) shift(
        .clk(tick), 
        .reset(reset), 
        .ctrl(2'b10), 
        .d(data_out), 
        .q(disp_val));
    
    // Counter to increment address out of BRAM    
    counter#(.SIZE(6)) mem_out_count(
        .clk(tick), 
        .reset(reset), 
        .count(addrb));
    
    // Counter to increment input address after every input    
    counter#(.SIZE(4)) addr_in(
        .clk(enter), 
        .reset(reset), 
        .count(addra));
    
    // Hex to sseg conversion for 8 displays     
    hex_to_sseg display_val0(
        .hex(disp_val[3:0]), 
        .dp(1), 
        .sseg(hex[7:0]));
        
    hex_to_sseg display_val1(
        .hex(disp_val[7:4]), 
        .dp(1), 
        .sseg(hex[15:8]));
        
    hex_to_sseg display_val2(
        .hex(disp_val[11:8]), 
        .dp(1), 
        .sseg(hex[23:16]));
        
    hex_to_sseg display_val3(
        .hex(disp_val[15:12]), 
        .dp(1), 
        .sseg(hex[31:24]));
        
    hex_to_sseg display_val4(
        .hex(disp_val[19:16]), 
        .dp(1), 
        .sseg(hex[39:32]));
        
    hex_to_sseg display_val5(
        .hex(disp_val[23:20]), 
        .dp(1), 
        .sseg(hex[47:40]));
        
    hex_to_sseg display_val6(
        .hex(disp_val[27:24]), 
        .dp(1), 
        .sseg(hex[55:48]));
        
    hex_to_sseg display_val7(
        .hex(disp_val[31:28]), 
        .dp(1), 
        .sseg(hex[63:56]));
    
    // Display mux    
    disp_mux display(
        .clk(clk), 
        .reset(reset), 
        .in0(hex[7:0]), 
        .in1(hex[15:8]), 
        .in2(hex[23:16]), 
        .in3(hex[31:24]), 
        .in4(hex[39:32]), 
        .in5(hex[47:40]), 
        .in6(hex[55:48]), 
        .in7(hex[63:56]), 
        .an(an), 
        .sseg(sseg));
     
endmodule
