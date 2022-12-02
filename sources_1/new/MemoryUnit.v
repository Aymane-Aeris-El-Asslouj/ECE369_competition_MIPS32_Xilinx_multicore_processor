`timescale 1ns / 1ps
`default_nettype none

module MemoryUnit(EX_MEM_ALUResult, EX_MEM_rt_val, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl, 

                MEM_ReadData_A, MEM_ReadData_B,
                
                EX_MEM_load_buff_a, EX_MEM_load_buff_b,
                buf_val_1_addr, buf_val_2_addr,
                buf_val_1_select, buf_val_2_select,
                
                Reset, MEM_Address_2
    );
    
    parameter memories = "none_2.mem";
    
    input wire Clk, EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl, Reset;
    
    input wire EX_MEM_load_buff_a, EX_MEM_load_buff_b;
    
    input [31:0] EX_MEM_ALUResult;
    input [31:0] EX_MEM_rt_val;
    
    wire [31:0] pseudo_ReadData_A;
    
    output reg [31:0] MEM_ReadData_A;
    output wire [31:0] MEM_ReadData_B, MEM_Address_2;
    
    
    output wire [4:0] buf_val_1_addr, buf_val_2_addr;
    input wire [31:0] buf_val_1_select, buf_val_2_select;
    
    DataMemory #(.memories(memories)) m0(
        .EX_MEM_Address(EX_MEM_ALUResult),
        .EX_MEM_WriteData(EX_MEM_rt_val),
        .Clk(Clk),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .MEM_ReadData_A(pseudo_ReadData_A),
        .MEM_ReadData_B(MEM_ReadData_B),
        .EX_MEM_HalfControl(EX_MEM_HalfControl),
        .EX_MEM_ByteControl(EX_MEM_ByteControl),
        .Reset(Reset),
        .MEM_Address_2(MEM_Address_2)
    );
    
    assign buf_val_1_addr = EX_MEM_ALUResult[4:0];
    assign buf_val_2_addr = EX_MEM_ALUResult[4:0];
    
    always@(*) begin
        if (EX_MEM_load_buff_a) begin
            MEM_ReadData_A <= buf_val_1_select;
        end else if (EX_MEM_load_buff_b) begin
            MEM_ReadData_A <= buf_val_2_select;
        end else begin
            MEM_ReadData_A <= pseudo_ReadData_A;
        end
        //MEM_ReadData_A <= pseudo_ReadData_A;
    end
    
    
    
endmodule
