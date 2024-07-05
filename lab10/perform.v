`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:41 04/03/2024 
// Design Name: 
// Module Name:    perform 
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
`define STATE_EXECUTE 3
`define OP_ADDIU 6'b001001
`define OP_LW    6'b100011
`define OP_BEQ   6'b000100
`define OP_BNE   6'b000101
`define OP_RFORM 6'b000000
`define OP_ADDU  6'b000000
`define OP_SLT   6'b000000
`define FUNC_ADDU 6'b100001
`define FUNC_SLT  6'b101010
module perform(clk, state, opcode, rsv, rtv, immediate, func, program_counter, result, result_valid
    );

   input clk;
	input [2:0] state;
	input [5:0] opcode;
	input [7:0] rsv;
	input [7:0] rtv;
	input [15:0] immediate;
	input [5:0] func;
	
	output [7:0] result;
	output result_valid;
	output [7:0] program_counter;
	
	reg [7:0] result;
	reg result_valid;
	reg [7:0] program_counter;
	
	initial begin
	   	result_valid = 0;
		program_counter = 0;
	end
	
	always @ (posedge clk) begin
	   	if (state == `STATE_EXECUTE) begin
		   	if ((opcode == `OP_ADDU) && (func == `FUNC_ADDU)) begin
			   	result <= rsv + rtv;
				result_valid <= 1;
				program_counter <= program_counter + 1;
			end
			else if ((opcode == `OP_SLT) && (func == `FUNC_SLT)) begin
			   	result <= ($signed(rsv) < $signed(rtv)) ? 8'b00000001 : 8'b00000000;
				result_valid <= 1;
				program_counter <= program_counter + 1;
			end
			else if(opcode == `OP_LW) begin
			   	result <= rsv + immediate[7:0];
				result_valid <= 1;
				program_counter <= program_counter + 1;
			end
			else if(opcode == `OP_ADDIU) begin
			   	result <= rsv + immediate[7:0];
				result_valid <= 1;
				program_counter <= program_counter + 1;
			end
			else if (opcode == `OP_BEQ) begin
			   	program_counter <= ((rsv == rtv) ? (program_counter + immediate[7:0]) : (program_counter + 1));
				result_valid <= 0;
			end
			else if (opcode == `OP_BNE) begin
			   	program_counter <= ((rsv != rtv) ? (program_counter + immediate[7:0]) : (program_counter + 1));
				result_valid <= 0;
			end
			else begin
			   	result_valid <= 0;
				program_counter <= program_counter + 1;
			end
		end
	end
endmodule
