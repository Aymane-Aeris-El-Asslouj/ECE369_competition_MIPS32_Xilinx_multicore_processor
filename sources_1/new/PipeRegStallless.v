

`timescale 1ns / 1ps


module PipeRegStallless #(parameter WIDTH=1)(Clk, Reset, in, out, flush);
    
    input wire Clk, Reset, flush;
    input wire [WIDTH-1:0] in;
    output reg [WIDTH-1:0] out;
    
    
     always@(posedge Clk) begin
        if(Reset) begin
            out <= {WIDTH{1'b0}};
        end else begin 
            if(flush) begin
                out <= {WIDTH{1'b0}};
            end else begin
                out <= in; 
            end
	    end
	end
	
	
	
endmodule