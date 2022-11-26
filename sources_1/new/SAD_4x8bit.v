`timescale 1ns / 1ps


module SAD_4x8bit (A, B, out);
    
    input [31:0] A, B;
    output [9:0] out;
    
    
    wire signed [8:0] C1, C2, C3, C4;
    
    assign C1 = {1'b0, A[7:0]} - {1'b0, B[7:0]};
    assign C2 = {1'b0, A[15:8]} - {1'b0, B[15:8]};
    assign C3 = {1'b0, A[23:16]} - {1'b0, B[23:16]};
    assign C4 = {1'b0, A[31:24]} - {1'b0, B[31:24]};
    
    assign out = ((C1 >0)?C1:-C1) + ((C2 >0)?C2:-C2) + ((C3 >0)?C3:-C3) + ((C4 >0)?C4:-C4);
	
	
endmodule
