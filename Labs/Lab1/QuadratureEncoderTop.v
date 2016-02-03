module QuadratureEncoderTop #(N = 38, encCountBits = 26, precBits = 12, stp = 21516)(
	input clk,
	input reset,
	input A,
	input B,
	output Trvl, // are we 
	output FwdBck // forward or backwards motion
	
	);
	
	reg[N-1:0] Fwd, MP, Bck; // these registers will save the values for specific points to keep track of total distance
	wire _A, _B; //represent filtered signals
	
	//initialize modules used in motion detection sytem
	EncoderDigitalFilter InputAFilter(.clk(clk), .sig(A), .filteredSig(_A)));
	EncoderDigitalFilter InputBFilter(.clk(clk), .sig(B), .filteredSig(_B)));
	
	//assign internal signals 
	assign Trvl = MvFwd | MvBck;
	assign FwdBack = MvFwd;
	
	always @ (posedge clk) begin
	
		if (reset) begin //check if a reset occurs
			Fwd = stp;
			MP = 0;
			Bck = -stp;
		end
		else begin
			
		end
		
		
	end

endmodule
