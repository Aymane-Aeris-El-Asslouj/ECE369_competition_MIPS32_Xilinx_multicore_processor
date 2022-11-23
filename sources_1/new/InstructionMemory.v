`timescale 1ns / 1ps
`default_nettype none

module InstructionMemory(PC, IF_Instruction);


    input [31:0] PC;        // Input Address 

    output [31:0] IF_Instruction;    // Instruction at memory location Address
    
    reg [31:0] memory [0:16383];
    
    wire [13:0] word_address;
    
    assign word_address = PC[15:2];
    
    assign IF_Instruction = memory[word_address];
    
    
    initial begin

        $readmemh("instruction_memory.mem", memory);
            
    end
endmodule
