

`timescale 1ns / 1ps


module BufReg (input wire Clk, Reset, write, stall,
               input wire [31:0] in_1, in_2,
               output reg [31:0] out_1, out_2,
               output reg flag);
    
    
     always@(posedge Clk) begin
        if(Reset) begin
            out_1 <= 32'b0;
            out_2 <= 32'b0;
            flag <= 1'b0;
        end else begin 
            if(write & (~stall)) begin
                out_1 <= in_1;
                out_2 <= in_2;
                flag <= 1;
            end
	    end
	end
	
endmodule
