`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:14 04/03/2024 
// Design Name: 
// Module Name:    state 
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
`define STATE_READ_FROM_INSTRUCTION 0
`define STATE_WRITE 5
`define STATE_OUTPUT 6
`define MAX_PC 11
module state(clk, program_counter, state
    );
   	input clk;
   	input [7:0] program_counter;
	output [2:0] state;
	
	reg [2:0] state;
	
	initial begin
	   	state = `STATE_READ_FROM_INSTRUCTION;
	end
	
	always @ (posedge clk) begin
	   	if ((state == `STATE_WRITE) && (program_counter < `MAX_PC)) begin
         		state <= `STATE_READ_FROM_INSTRUCTION;
		end
		else if (state != `STATE_OUTPUT) begin
		   	state <= state + 1;
		end
	end
endmodule
