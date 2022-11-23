`timescale 1ns / 1ps
`default_nettype none

module InstructionFetchUnit(ID_PCSrc, Reset, Clk, ID_new_PC, ID_stall,
    
                            IF_Instruction, IF_PC4);

    input wire Clk, Reset, ID_PCSrc, ID_stall;
    input [31:0] ID_new_PC;
    
    wire [31:0] PC;
    wire [31:0] PC4;
    reg [31:0] inner_new_PC;
    output [31:0] IF_Instruction;
    output [31:0] IF_PC4;
    assign IF_PC4 = PC4;
    
    assign PC4 = PC + 4;
    
    always@(*) begin
        case (ID_PCSrc)
            1'b0: inner_new_PC <= PC4;
            1'b1: inner_new_PC <= ID_new_PC; 
            default: inner_new_PC <= 32'bX;
        endcase
    end
    
    ProgramCounter id0(
        .inner_new_PC(inner_new_PC),
        .PC(PC),
        .ID_stall(ID_stall),
        .Reset(Reset),
        .Clk(Clk)
    ); 
    
    InstructionMemory id1(
        .PC(PC),
        .IF_Instruction(IF_Instruction)
    ); 
    
endmodule

