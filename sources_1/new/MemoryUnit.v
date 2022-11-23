`timescale 1ns / 1ps
`default_nettype none

module MemoryUnit(EX_MEM_ALUResult, EX_MEM_rt_val, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl, 

                MEM_ReadData
    );
    
    input wire Clk, EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl;
    
    input [31:0] EX_MEM_ALUResult;
    input [31:0] EX_MEM_rt_val;
    
    output [31:0] MEM_ReadData;
    
    DataMemory m0(
        .EX_MEM_Address(EX_MEM_ALUResult),
        .EX_MEM_WriteData(EX_MEM_rt_val),
        .Clk(Clk),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .MEM_ReadData(MEM_ReadData),
        .EX_MEM_HalfControl(EX_MEM_HalfControl),
        .EX_MEM_ByteControl(EX_MEM_ByteControl)
    );
    
    
    
endmodule
