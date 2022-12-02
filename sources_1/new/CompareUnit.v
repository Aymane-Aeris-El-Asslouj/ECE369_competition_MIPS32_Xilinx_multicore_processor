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
	
	wire eq_me;
	assign eq_me = A == B;
	
	//wire gz_me;
	//assign gz_me = (A > 0);
	
	wire lz_me;
	assign lz_me = (A < 0);
    
    always@(*) begin
        case(CompareControl)
            //GTZ: CompareResult <= gz_me;
            LTZ: CompareResult <= lz_me;
            GEZ: CompareResult <= ~lz_me;
            //LEZ: CompareResult <= ~gz_me;
            EQ: CompareResult <= eq_me;
            NEQ: CompareResult <= ~eq_me;
            default: CompareResult <= 1'bX;
        endcase
    end

endmodule
