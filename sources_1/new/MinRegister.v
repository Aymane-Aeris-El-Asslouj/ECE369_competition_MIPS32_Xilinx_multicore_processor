`timescale 1ns / 1ps


module MinRegister (Clk, min_in, max_out, in, out_stored, tag, out_tag);
    
    input wire Clk, min_in, max_out;
    input wire [31:0] tag;
    
    reg [44:0] stored;
    output wire [12:0] out_stored;
    output wire [31:0] out_tag;
    
    input [12:0] in;
    
    assign out_stored = stored[12:0];
    assign out_tag = stored[44:13];
    
     always@(posedge Clk) begin
        if(max_out) begin
            stored <= {45{1'b1}};
        end else if(min_in & in < stored[12:0]) begin
            stored <= {tag, in};
	    end
	end
	
	
endmodule
