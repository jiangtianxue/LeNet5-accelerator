`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/04 15:18:09
// Design Name: 
// Module Name: test_mult_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: test module of mult_add
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_mult_add;
parameter BITWIDTH = 8;
reg clk, reset;
reg [BITWIDTH-1:0] a, b;
wire [BITWIDTH*2-1:0] c;

mult_add test_mult_add(
			.clk(clk),
			.reset(reset),
			.a(a),
			.b(b),
			.c(c)
);

initial
	begin
		clk = 0;
		reset = 1;
		a = 0;
		b = 0;
	end

always #5 clk = ~clk;

initial
	begin
		#10 reset = 0;
		#20 a = 0000_0011; b = 0000_1000;
		#10 a = 1111_1100; b = 0000_1100;
		#20 a = 0000_0011; b = 0000_0100;
		#30 a = 4; b = 5;
		#10 a = -3; b = 2;
		#10 a = 6; b = -2;
		#10 a = 9; b = -2;
		#30 $stop;
	end
endmodule 
