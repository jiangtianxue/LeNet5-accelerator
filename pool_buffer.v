`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 15:34:41
// Design Name: 
// Module Name: pool_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pool_buffer#(
parameter bitwidth = 17)
(
input clk, reset,
input flag_start,
input wire signed [bitwidth-1:0] data_in,
output reg signed [bitwidth-1:0] a, b, c, d,
output reg flag_trans);

reg [bitwidth-1:0] buffer [0:3];
reg [2:0] counter;

always@(posedge clk or posedge reset)
	begin
		if (!reset)
			begin
				a <= 0;
				b <= 0;
				c <= 0;
				d <= 0;
				flag_trans <= 0;
				counter <= 0;
			end
		else 
			begin
				if (counter == 4)
					begin
						a <= buffer[0];
						b <= buffer[1];
						c <= buffer[2];
						d <= buffer[3];
						counter <= 0;
						flag_trans <= 1;
					end
				else if (flag_start)
					begin
						flag_trans <= 0;
						buffer[counter] <= data_in;
						counter <= counter + 1;
					end
				else
					begin
						flag_trans <= 0;
					end
					
			end
	end
endmodule
