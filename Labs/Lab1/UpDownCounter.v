// UpDownCounter
// UpDownCounter.v
// Author: Cody Kaufman
// 1/21/16

module UpDownCounter #(WIDTH=8)(
	input clk,
	input reset, 
	input enable, //enable counting
	input dir, //count up or down
	output reg [WIDTH - 1:0] count //holds the total count 
	);
	
	always @ (posedge clk ) begin
		if (~reset) begin
			count <= 0;
		end
		
		if (enable) begin
			if(dir)
				count <= count + 1'b1;
			else
				count <= count - 1'b1;
		end
	end


endmodule
