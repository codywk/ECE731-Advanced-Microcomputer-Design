module QuadratureEncoderTop #(N = 38, encCountBits = 26, precBits = 12, stp = 120218)(
	input clk,
	input reset,
	input A,
	input B,
	output Trvl,
	output FwdBck, // forward or backwards motion	
	output[encCountBits - 1 : 0] encCount,
	output reg[11 : 0] inches,
	output[20 : 0] display
	);
		
	reg[N - 1 : 0] Fwd, MP, Bck; // these signals will save the values for specific points to keep track of total
	
	wire _A, _B; //represent filtered signals
	wire MvFwd, MvBck; //represents the direction of travel in our QuadEncoder
	wire dir; //internal signal for encoder counter and updownCounter
	wire change; //was there an encoder pulse
	
	//initialize modules used in motion detection sytem
	EncoderDigitalFilter 			InputAFilter(.clk(clk), .sig(A), .filteredSig(_A));
	EncoderDigitalFilter 			InputBFilter(.clk(clk), .sig(B), .filteredSig(_B));
	EncoderDecoder 					QuadratureEncoder(.clk(clk), .A(_A), .B(_B), .change(change), .direction(dir));
	UpDownCounter #(encCountBits) QuadPulseCounter(.clk(clk), .reset(reset), .enable(change), .dir(dir), .count(encCount));
	seven_seg							DigitZero( .digit(inches[3:0]), .seg_out(display[6:0]));
	seven_seg							DigitOne( .digit(inches[7:4]), .seg_out(display[13:7]));
	seven_seg							DigitTwo( .digit(inches[11:8]), .seg_out(display[20:14]));
	
	//assign internal signals
	assign MvFwd = (encCount == Fwd[N - 1 : precBits]);
	assign MvBck = (encCount == Bck[N - 1 : precBits]);
	assign Trvl = MvFwd | MvBck;
	assign FwdBck = MvFwd;
	
	always @(posedge clk) begin
	
		Fwd <= ~reset ? (stp) : (Trvl ? (FwdBck ? (Fwd + stp) : (MP) ) : (Fwd));
		MP  <= ~reset ? (0) : (Trvl ? (FwdBck ? (Fwd) : (Bck)) : (MP));
		Bck <= ~reset ? (-stp) : (Trvl ? (FwdBck ? (MP) : (Bck - stp) ) : (Bck));
		
		if(~reset) begin
			inches = 0;
		end
		
		else begin
			if(encCount == Fwd[N - 1 : precBits]) begin
				inches <= inches + 1'b1;
			end
			else if(encCount == Bck[N - 1 : precBits]) begin
				inches <= inches - 1'b1;
			end
		end
		
	end

endmodule
