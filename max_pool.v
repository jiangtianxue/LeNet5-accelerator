`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 15:13:21
// Design Name: 
// Module Name: max_pool
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


module max_pool#(
parameter BITWIDTH = 17)
(
input clk, reset,
input wire signed [BITWIDTH-1:0] a, b, c, d,
input flag_receive,
output reg signed [BITWIDTH*2-1:0] max_number,
output reg flag_store);

always@(posedge clk or posedge reset)
	begin
		if (!reset)
			begin
				flag_store <= 0;
				max_number <= 0;
			end
		else if (flag_receive)
			begin
				max_number <= (a > b ? a : b) > (c > d ? c : d) ? (a > b ? a : b) : (c > d ? c : d);
				flag_store <= 1;
			end
		else
			begin
				flag_store <= 0;
			end
	end

endmodule
