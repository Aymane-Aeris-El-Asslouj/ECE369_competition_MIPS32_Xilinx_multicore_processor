`timescale 1ns / 1ps
`default_nettype none

module MemoryUnit(EX_MEM_ALUResult, EX_MEM_rt_val, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl, 

                MEM_ReadData,
                
                EX_MEM_load_buff_a, EX_MEM_load_buff_b,
                buf_val_1_addr, buf_val_2_addr,
                buf_val_1_select, buf_val_2_select
    );
    
    parameter memories = "none_2.mem";
    
    input wire Clk, EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl;
    
    input wire EX_MEM_load_buff_a, EX_MEM_load_buff_b;
    
    input [31:0] EX_MEM_ALUResult;
    input [31:0] EX_MEM_rt_val;
    
    wire [31:0] pseudo_ReadData;
    
    output reg [31:0] MEM_ReadData;
    
    
    output wire [4:0] buf_val_1_addr, buf_val_2_addr;
    input wire [31:0] buf_val_1_select, buf_val_2_select;
    
    DataMemory #(.memories(memories)) m0(
        .EX_MEM_Address(EX_MEM_ALUResult),
        .EX_MEM_WriteData(EX_MEM_rt_val),
        .Clk(Clk),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .MEM_ReadData(pseudo_ReadData),
        .EX_MEM_HalfControl(EX_MEM_HalfControl),
        .EX_MEM_ByteControl(EX_MEM_ByteControl)
    );
    
    assign buf_val_1_addr = EX_MEM_ALUResult[4:0];
    assign buf_val_2_addr = EX_MEM_ALUResult[4:0];
    
    always@(*) begin
        if (EX_MEM_load_buff_a) begin
            MEM_ReadData <= buf_val_1_select;
        end else if (EX_MEM_load_buff_b) begin
            MEM_ReadData <= buf_val_2_select;
        end else begin
            MEM_ReadData <= pseudo_ReadData;
        end
    end
    
    
    
endmodule
