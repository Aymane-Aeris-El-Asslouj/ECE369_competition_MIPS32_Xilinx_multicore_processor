`timescale 1ns / 1ps


module SAD_4x8bit (A, B, out);
    
    input [31:0] A, B;
    output [31:0] out;
    
    
    wire [31:0] C1, C2, C3, C4;
    
    assign C1 = A[7:0] - B[7:0];
    assign C2 = A[15:8] - B[15:8];
    assign C3 = A[23:16] - B[23:16];
    assign C4 = A[31:24] - B[31:24];
    
    assign out = ((C1 >0)?C1:-C1) + ((C2 >0)?C2:-C2) + ((C3 >0)?C3:-C3) + ((C4 >0)?C4:-C4);
    
	
	
endmodule
