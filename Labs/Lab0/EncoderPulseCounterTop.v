module EncoderPulseCounterTop #(WIDTH=8)(
	input A,
	input B,
	input clk,
	input reset,
	output [WIDTH-1:0] count);
	
	wire dir, enable; //internal signals for the system
	
	EncoderDecoder encoder(.A(A), .B(B), .clk(clk), .change(enable), .direction(dir));
	UpDownCounter udCtr(.enable(enable), .dir(dir), .clk(clk), .reset(reset), .count(count));
	
endmodule
