`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ZJU
// Engineer: LiuRun
// 
// Create Date: 2020/02/04 14:28:20
// Design Name: mnist_acce
// Module Name: conv_filter5
// Project Name: mnist_acce
// Target Devices: 
// Tool Versions: 
// Description: this is the convolution kernal, kernal size is 5*5
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv_filter5#(
parameter FILTER_WIDTH = 5,
parameter FILTER_HEIGHT = 5,
parameter FILTER_CHANNEL = 3,
parameter BITWIDTH = 8)
(
input clk,
input reset,
input wire signed [BITWIDTH-1:0] weight,
input wire signed [BITWIDTH-1:0] data,
input wire signed [BITWIDTH*2-1:0] bias,
output signed [BITWIDTH*2-1:0] result 
    );

mult_add#(BITWIDTH) filter5(
					.clk(clk),
					.reset(reset),
					.a(weight),
					.b(data),
					.c(result)

);
	
endmodule
