`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/07 12:51:10
// Design Name: 
// Module Name: test_max_pool
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


module test_max_pool;
parameter BITWIDTH = 8;

reg signed [BITWIDTH-1:0] a, b, c, d;
wire signed [BITWIDTH-1:0] max_number;

max_pool max_pool_test(
					.a(a),
					.b(b),
					.c(c),
					.d(d),
					.max_number(max_number)
);

initial 
	begin
		a = 0; b = 0; c = 0; d = 0;
		#10 a = 1; b = 2; c = 3; d = 4;
		#20 a = -1; b = -2; c = -4; d = -3;
		#30 a = 4; b = 3; c = -8; d = -6;
		#20 $stop;
	end

endmodule
