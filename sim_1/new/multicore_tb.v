// Aeris El Asslouj 100%
// Group 26


`timescale 1ns / 1ps
`default_nettype none


module multicore_tb();
    reg Clk;
    reg Reset;
    integer i =0;


    wire [31:0] out_v0, out_v1, out_s0, out_PC;
    MultiCore t1(Clk, Reset, out_v0, out_v1, out_s0, out_PC); //, buf_val_1_s, buf_val_2_s, buf_flag_s);

	initial begin
		Clk <= 1'b0;
		forever #5 Clk <= ~Clk;
	end
	
	initial begin
	   Reset <= 1;
	   @(posedge Clk) #1;
	   @(posedge Clk) #1;
	   @(posedge Clk) #1;
	   @(posedge Clk) #1;
	   Reset <= 0;
	    
	   
	end


endmodule
