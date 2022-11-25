

`timescale 1ns / 1ps


module RingReg (input wire Clk, Reset,
               input wire [63:0] ring_in,
               output reg [63:0] ring_out);
    
    
     always@(posedge Clk) begin
        if(Reset) begin
            ring_out <= 34'b0;
        end else begin 
        
	    end
	 end
	
endmodule
