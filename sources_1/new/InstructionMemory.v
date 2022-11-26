`timescale 1ns / 1ps
`default_nettype none

module InstructionMemory(PC, IF_Instruction);

    parameter instructions = "none.mem";

    input wire [31:0] PC;        // Input Address 

    output wire [31:0] IF_Instruction;    // Instruction at memory location Address
    
    reg [31:0] memory [0:127];
    
    assign IF_Instruction = memory[PC[8:2]];
    
    
    initial begin

        $readmemh(instructions, memory);
            
    end
endmodule
