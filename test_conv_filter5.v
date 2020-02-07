`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/06 13:06:26
// Design Name: 
// Module Name: test_conv_filter5
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


module test_conv_filter5#(
parameter BITWIDTH = 8,
parameter FILTER_HEIGHT = 5,
parameter FILTER_WIDTH = 5,
parameter FILTER_CHANNEL = 3);

reg clk, reset;
reg signed [BITWIDTH-1:0] weight;
reg signed [BITWIDTH-1:0] data;
reg signed [BITWIDTH*2-1:0] bias;
wire signed [BITWIDTH*2-1:0] result;

reg [BITWIDTH-1:0] weight_memory [0:FILTER_WIDTH*FILTER_HEIGHT*FILTER_CHANNEL-1];
reg [BITWIDTH-1:0] data_memory [0:FILTER_WIDTH*FILTER_HEIGHT*FILTER_CHANNEL-1];

initial
	begin
		$readmemb("H:/verilog_project/mnist_acce/mnist_sim_data/filter/weight.txt", weight_memory);
		$readmemb("H:/verilog_project/mnist_acce/mnist_sim_data/filter/data.txt", data_memory);
	end

initial 
	begin
		clk = 0;
		reset = 1;
		weight = 0;
		data = 0;
		bias = 0;
		#10 reset = 0;
	end

always #5 clk = ~clk;


conv_filter5 test(
			.clk(clk),
			.reset(reset),
			.weight(weight),
			.data(data),
			.bias(bias),
			.result(result)
);


reg [7:0] counter;
always@(posedge clk or negedge reset)
	begin
		if (reset)
			begin
				counter <= 0;
			end
		else if (counter == 75)
			begin
				$stop;
			end
		else
			begin
				weight <= weight_memory[counter];
				data <= data_memory[counter];
				counter <= counter + 1;
			end
			
	end

endmodule
