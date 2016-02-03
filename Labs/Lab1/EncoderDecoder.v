// Encoder/Decoder
// EncoderDecoder.v
// Author: Cody Kaufman
// 1/21/16

module EncoderDecoder(
	input A,
	input B,
	input clk,
	output change,
	output direction);
	
	reg _A, _B;
	
	assign change = (_A ^ A) | (_B ^ B);
	assign direction = (A ^ _B);
	
	always @ (posedge clk) begin
		_A = A;
		_B = B;
	end

endmodule 