// File:				seven_seg.v
//	
//	Description:  	Asynchronous Seven Segement Module
//
//	Author(s):		Kyle Rogge
//
//	Date Created:  Feburary 16, 2015
//
//	Revision History:
//				1.0	2/12/2015  Original version
//
module seven_seg( digit, seg_out);

	// raw input from board switches in the form of big-endian binary
	input 	[3:0] digit;	
	
	// Output for the seven segment display from the switches. Converts
	// the binary to seven segment values
	output	[6:0] seg_out;
	reg	 	[6:0] seg_out;

	// Asynchronous seven segment decoder logic.
	// Takes the input from the board switches and translates them to seven segment logic
	//  -a- 
	// f| |b 
	//  -g- 
	// e| |c 
	//  -d- 
	always@(digit)
		case (digit)
			4'h0 : seg_out = 7'b0000001;
			4'h1 : seg_out = 7'b1001111;
			4'h2 : seg_out = 7'b0010010;
			4'h3 : seg_out = 7'b0000110;
			4'h4 : seg_out = 7'b1001100;
			4'h5 : seg_out = 7'b0100100;
			4'h6 : seg_out = 7'b0100000;
			4'h7 : seg_out = 7'b0001111;
			4'h8 : seg_out = 7'b0000000;
			4'h9 : seg_out = 7'b0000100;
			
			4'hA : seg_out = 7'b0001000;
			4'hB : seg_out = 7'b1100000;
			4'hC : seg_out = 7'b0110001;
			4'hD : seg_out = 7'b1000010;
			4'hE : seg_out = 7'b0110000;
			4'hF : seg_out = 7'b0111000;
			default: seg_out = 7'b1111111;
		endcase
		
endmodule