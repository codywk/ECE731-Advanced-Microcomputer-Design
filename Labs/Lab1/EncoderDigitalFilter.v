//
//
//
// Description : if an incoming signal is high for 2 or more clock cycles we can interpret this as being a true
//  digital high. If there is a noise pulse that causes the signals

module EncoderDigitalFilter(
	input clk,
	input sig, // incoming signal
	output reg filteredSig // filtered output
	);
	
	reg H2, H1, H0; // these registers will save previous input values to determineg if a signal is high or low
	
	always @ (posedge clk) begin
		
		//shift previous values
		H0 <= sig;
		H1 <= H0;
		H2 <= H1;
		
		if((H0 & H1) || (H1 & H2) || (H2 & H0)) begin
			filteredSig <= 1'b1;	
		end
		else begin
			filteredSig <= 1'b0;
		end
		
	end
	
endmodule
