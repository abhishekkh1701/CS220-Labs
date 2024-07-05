`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:24 04/03/2024 
// Design Name: 
// Module Name:    main_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define STATE_MEMORY 4
`define MEM_READ  2'b00
`define MEM_WRITE 2'b01
module main_mem(clk, state, address, op, store_value, load_value);

   input clk;
	input [2:0] state;
	input [7:0] address;
	input [1:0] op;
	input [7:0] store_value;
	
	output [7:0] load_value;
	
	reg [7:0] load_value;
	reg [7:0] data_mem [0:2];
	
	initial begin
	   data_mem[0] = 8'b11101100;
		data_mem[1] = 8'b00001010;
		data_mem[2] = 8'b00000010;
	end
	
	always @ (posedge clk) begin
	   	if (state == `STATE_MEMORY) begin
		   	if (op == `MEM_READ) begin
			   	load_value <= data_mem[address];
			end
			else if (op == `MEM_WRITE) begin
			   	data_mem[address] <= store_value;
			end
		end
	end
endmodule
