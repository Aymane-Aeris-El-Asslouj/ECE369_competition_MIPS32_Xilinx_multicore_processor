

`timescale 1ns / 1ps


module ResetReg (Clk, in, out);
    
    input wire Clk;
    input wire in;
    
    output reg out;
    
    
     always@(posedge Clk) begin
         out <= in; 
	end
	
	
endmodule
