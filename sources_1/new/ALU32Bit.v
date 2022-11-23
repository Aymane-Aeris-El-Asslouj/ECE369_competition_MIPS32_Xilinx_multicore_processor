`timescale 1ns / 1ps
`default_nettype none

module ALU32Bit(ALUControl, A, B, shamt,

                ALUResult);

    localparam [3:0]
    AND = 4'd0,
    OR = 4'd1,
    ADD = 4'd2,
    XOR = 4'd3,
    SLL = 4'd4,
    SRL = 4'd5,
    SUB = 4'd6,
    SLT = 4'd7,
    MUL = 4'd8,
    NOR = 4'd9;

	input [3:0] ALUControl;
	input signed [31:0] A, B;
	input [4:0] shamt;

	output reg signed [31:0] ALUResult;
    
    always@(*) begin
        case(ALUControl)
            AND: ALUResult <= A & B;
            OR: ALUResult <= A | B;
            ADD: ALUResult <= A + B;
            XOR: ALUResult <= A ^ B;
            SLL: ALUResult <= B << shamt;
            SRL: ALUResult <= B >> shamt;
            SUB: ALUResult <= A - B;
            SLT: ALUResult <= (A < B);
            MUL: ALUResult <= A * B;
            NOR: ALUResult <= ~(A | B);
            default: ALUResult <= 32'bX;
        endcase
    end

endmodule

