// Encoder/Decoder
// EncoderDecoder.v
// Author: Cody Kaufman
// 1/21/16

module EncoderDecoder(
	input clk,
	input A, //quadrature encoder input 1
	input B, //quadrature encoder input 2
	output change, //is there a new pulse
	output direction //are we traveling forward or backwards
	);
	
	reg _A, _B;
	
	assign change = (_A ^ A) | (_B ^ B);
	assign direction = (A ^ _B);
	
	always @ (posedge clk) begin
		_A <= A;
		_B <= B;
	end

endmodule 