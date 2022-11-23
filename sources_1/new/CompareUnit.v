`timescale 1ns / 1ps
`default_nettype none

module CompareUnit(CompareControl, A, B, CompareResult);

    localparam [2:0] GTZ = 3'd0;
    localparam [2:0] LTZ = 3'd1;
    localparam [2:0] GEZ = 3'd2;
    localparam [2:0] LEZ = 3'd3;
    localparam [2:0] EQ = 3'd4;
    localparam [2:0] NEQ = 3'd5;

	input [2:0] CompareControl;
	input signed [31:0] A, B;
	output reg CompareResult;
    
    always@(*) begin
        case(CompareControl)
            GTZ: CompareResult <= (A > 0);
            LTZ: CompareResult <= (A < 0);
            GEZ: CompareResult <= (A >= 0);
            LEZ: CompareResult <= (A <= 0);
            EQ: CompareResult <= (A == B);
            NEQ: CompareResult <= (A != B);
            default: CompareResult <= 1'bX;
        endcase
    end

endmodule
