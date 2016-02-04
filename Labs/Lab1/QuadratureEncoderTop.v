module QuadratureEncoderTop #(N = 38, encCountBits = 26, precBits = 12, stp = 21516)(
	input clk,
	input reset,
	input A,
	input B,
	output Trvl,
	output FwdBck, // forward or backwards motion	
	output[encCountBits - 1 : 0] encCount,
	output[N - 1 : 0] forward, back, mid
	);
	
	wire[N - 1 : 0] Fwd, MP, Bck; // these registers will save the values for specific points to keep track of total
	reg MvFwd, MvBck; //represents the direction of travel
	wire _A, _B; //represent filtered signals
	wire dir;
	wire change; //was there an encoder pulse
	
	//initialize modules used in motion detection sytem
	EncoderDigitalFilter 			InputAFilter(.clk(clk), .sig(A), .filteredSig(_A));
	EncoderDigitalFilter 			InputBFilter(.clk(clk), .sig(B), .filteredSig(_B));
	EncoderDecoder 					QuadratureEncoder(.clk(clk), .A(_A), .B(_B), .change(change), .direction(dir));
	UpDownCounter #(encCountBits) QuadPulseCounter(.clk(clk), .reset(reset), .enable(change), .dir(dir), .count(encCount));
	
	//assign internal signals 
	assign Trvl = MvFwd | MvBck;
	assign FwdBck = MvFwd;
	assign Fwd = reset ? (stp) :(Trvl ? (FwdBck ? (Fwd + stp) : (MP) ) : (Fwd));
	assign MP  = reset ? (0) : (Trvl ? (FwdBck ? (Fwd) : (Bck) ) : (MP));
	assign Bck = reset ? (-stp) : (Trvl ? (FwdBck ? (MP) : (Bck - stp) ) : (Bck));
	assign forward = Fwd;
	assign back = Bck;
	assign mid = MP;
	
	always @ (posedge clk) begin
		if(encCount == Fwd[N - 1 : precBits]) begin
			MvFwd <= 1'b1;
			MvBck <= 1'b0;
		end
		else if(encCount == Bck[N - 1 : precBits]) begin
			MvBck <= 1'b1;
			MvFwd <= 1'b0;
		end
		else begin
			MvFwd <= 1'b0;
			MvBck <= 1'b0;
		end
		
	end

endmodule
