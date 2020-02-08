`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/07 18:59:06
// Design Name: 
// Module Name: conv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: this is the basic module of convolution layer, top module can instantiation this 
//               module to generate different convolution layer
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv1#(
parameter FILTER_WIDTH = 5,
parameter FILTER_HEIGHT = 5,
parameter FILTER_CHANNEL = 3,
parameter BITWIDTH = 8)
(
input clk, reset,
input wire signed [BITWIDTH-1:0] data1, data2, data3, data4, data5, data6,
input wire signed [BITWIDTH-1:0] weight1, weight2, weight3, weight4, weight5, weight6,
output reg signed [BITWIDTH*2-1:0] result1, result2, result3, result4, result5, result6
    );

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT1
(
			.clk(clk),
			.reset(reset),
			.a(data1),
			.b(weight1),
			.c(result1)
);

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT2
(
			.clk(clk),
			.reset(reset),
			.a(data2),
			.b(weight2),
			.c(result2)
);

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT3
(
			.clk(clk),
			.reset(reset),
			.a(data3),
			.b(weight3),
			.c(result3)
);

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT4
(
			.clk(clk),
			.reset(reset),
			.a(data4),
			.b(weight4),
			.c(result4)
);

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT5
(
			.clk(clk),
			.reset(reset),
			.a(data5),
			.b(weight5),
			.c(result5)
);

conv_filter5 #(
			.BITWIDTH(BITWIDTH),
			.FILTER_CHANNEL(FILTER_CHANNEL))
UUT6
(
			.clk(clk),
			.reset(reset),
			.a(data6),
			.b(weight6),
			.c(result6)
);

endmodule
