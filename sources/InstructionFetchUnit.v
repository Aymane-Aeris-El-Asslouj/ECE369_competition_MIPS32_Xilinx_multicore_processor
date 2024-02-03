`timescale 1ns / 1ps
`default_nettype none

module InstructionFetchUnit(ID_PCSrc, Reset, Clk, ID_new_PC, ID_stall,
    
                            IF_Instruction, IF_PC4);
                            
    parameter instructions = "none.mem";

    input wire Clk, Reset, ID_PCSrc, ID_stall;
    input [31:0] ID_new_PC;
    
    wire [31:0] PC;
    wire [31:0] PC4;
    reg [31:0] inner_new_PC;
    output [31:0] IF_Instruction;
    output [31:0] IF_PC4;
    assign IF_PC4 = PC4;
    
    assign PC4 = PC + 4;
    
    wire J;
    wire [5:0] opcode;
    
    
    wire [25:0] target_address;
    assign target_address = IF_Instruction[25:0];
    
    always@(*) begin
        case (J)
            1'b0: 
                case (ID_PCSrc)
                    1'b0: inner_new_PC <= PC4;
                    1'b1: inner_new_PC <= ID_new_PC; 
                    default: inner_new_PC <= 32'bX;
                endcase
            1'b1: inner_new_PC <= {PC4[31:28], target_address, 2'b00}; 
            default: inner_new_PC <= 32'bX;
        endcase
    end
    localparam [5:0] J_OPCODE = 6'b000010;
    localparam [5:0] JAL_OPCODE = 6'b000011;
    assign opcode = IF_Instruction[31:26];
    assign J = (opcode == J_OPCODE) | (opcode == JAL_OPCODE);
    
    ProgramCounter id0(
        .inner_new_PC(inner_new_PC),
        .PC(PC),
        .ID_stall(ID_stall),
        .Reset(Reset),
        .Clk(Clk)
    ); 
    
    InstructionMemory #(.instructions(instructions)) id1(
        .PC(PC),
        .IF_Instruction(IF_Instruction)
    ); 
    
endmodule

