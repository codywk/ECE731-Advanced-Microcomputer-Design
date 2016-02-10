// File:				seven_seg.v
//	
//	Description:  	Asynchronous Seven Segement Module
//
//	Author(s):		Cody Kaufman
//
//	Date Created:  Feburary 10, 2016
//
//	Revision History:
//				1.0	2/12/2015  Original version
//
module seven_seg( 
	input[3:0] digit, // 4 bit input to be converted to a sev seg display
	output reg [6:0] seg_out // converted input to be displayed on sev seg
	);

	// Asynchronous seven segment decoder logic.
	// Takes the input from the board switches and translates them to seven segment logic
	//  -a- 
	// f| |b 
	//  -g- 
	// e| |c 
	//  -d- 
	
	always@(digit)
		case (digit)
			4'h0 : seg_out = 7'b1000000;
			4'h1 : seg_out = 7'b1111001;
			4'h2 : seg_out = 7'b0100100;
			4'h3 : seg_out = 7'b0110000;
			4'h4 : seg_out = 7'b0011001;
			4'h5 : seg_out = 7'b0010010;
			4'h6 : seg_out = 7'b0000010;
			4'h7 : seg_out = 7'b1111000;
			4'h8 : seg_out = 7'b0000000;
			4'h9 : seg_out = 7'b0011000;
			
			4'hA : seg_out = 7'b0001000;
			4'hB : seg_out = 7'b0000011;
			4'hC : seg_out = 7'b1000110;
			4'hD : seg_out = 7'b0100001;
			4'hE : seg_out = 7'b0000110;
			4'hF : seg_out = 7'b0001110;
			
			default: seg_out = 7'b1111111;
			
		endcase
		
endmodule