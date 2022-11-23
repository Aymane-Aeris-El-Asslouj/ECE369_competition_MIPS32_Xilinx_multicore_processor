`timescale 1ns / 1ps


module ShiftRegister (Clk, Reset, shift_in, in, out);
    
    input wire Clk, Reset, shift_in;
    
    output reg [127:0] out;
    
    input [31:0] in;
    
     always@(posedge Clk) begin
        if(Reset) begin
            out <= 128'b0;
        end else begin 
            if(shift_in) begin
                out <= {in, out[127:32]}; 
            end
	    end
	end
	
	
endmodule
