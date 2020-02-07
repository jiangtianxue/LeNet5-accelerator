`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ZJU
// Engineer: LiuRun
// 
// Create Date: 2020/02/04 15:07:35
// Design Name: mnist_acce
// Module Name: mult_add
// Project Name: mnist_acce
// Target Devices: 
// Tool Versions: 
// Description: fix point multiplication and addition, just remember where is point will be ok
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_add#(
parameter BITWIDTH = 8)
(
input clk,
input reset,
input wire signed [BITWIDTH-1:0] a,
input wire signed [BITWIDTH-1:0] b,
output reg signed [BITWIDTH*2-1:0] c);

reg signed [BITWIDTH-1:0] temp_a;
reg signed [BITWIDTH-1:0] temp_b;
always@(posedge clk or negedge reset)
begin
	if (reset)
		begin
			temp_a <= 0;
			temp_b <= 0;
			c <= 0;

		end
	else if (temp_a == a && temp_b == b)
		begin
			c <= c;
		end
	else 
		begin
			c <= c + a * b;
			temp_a <= a;
			temp_b <= b;
		end
end
endmodule
