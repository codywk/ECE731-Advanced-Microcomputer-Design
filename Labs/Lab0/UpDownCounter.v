// UpDownCounter
// UpDownCounter.v
// Author: Cody Kaufman
// 1/21/16

module UpDownCounter #(WIDTH=8)(
	input enable,
	input dir,
	input clk,
	input reset,
	output reg [WIDTH - 1:0] count);
	
	//parameter WIDTH=8; // parameter to be passed in... default = 8
	
	//always @ (enable or ar) begin
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
