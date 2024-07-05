`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:22:06 01/31/2024
// Design Name:   blinking_led
// Module Name:   /users/btech/poojalk22/Desktop/cs220/lab3_1/blinking_led/blinking_led_top.v
// Project Name:  blinking_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blinking_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinking_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	blinking_led uut (
		.clk(clk), 
		.led0(led0)
	);

 always@(led0) begin
    $display("<%d>: led0=%b",$time,led0);
    end
    initial begin
        // Initialize Inputs
        forever begin
        clk = 0;
        #2
        clk=1;
        #2
        clk=0;
        // Wait 100 ns for global reset to finish

        // Add stimulus here
       end
    end
endmodule

