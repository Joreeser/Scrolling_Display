module counter#(
	parameter SIZE = 13)(
	input logic clk, reset,
	output logic [SIZE-1:0] count);

	always_ff @(posedge clk, posedge reset)
		if (reset)
			count = 0;
		else 
			count = count + 1;
		

endmodule
