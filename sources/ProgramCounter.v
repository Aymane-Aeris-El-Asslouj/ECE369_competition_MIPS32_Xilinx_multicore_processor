`timescale 1ns / 1ps
`default_nettype none

module ProgramCounter(inner_new_PC, PC, Reset, Clk, ID_stall);

	input [31:0] inner_new_PC;
	input wire Reset, Clk, ID_stall;

	//(* mark_debug = "true" *)
	output reg [31:0] PC;
	
	always @(posedge Clk) begin
	   
      if(Reset)begin
         PC <= 32'b0;
      end
      else begin
          if(!ID_stall) begin
            PC <= inner_new_PC;
          end
       end
   end

endmodule

