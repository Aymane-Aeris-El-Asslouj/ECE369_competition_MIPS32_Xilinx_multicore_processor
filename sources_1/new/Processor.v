// Aeris El Asslouj 100%
// Group 26
// 6 stage pipeline with branches in ID

`timescale 1ns / 1ps
`default_nettype none


module Processor(input wire Clk, Reset,
                output reg [31:0] out_v0, out_v1, out_write_data,
                output wire [31:0] out_PC);
                
    parameter memory_file = "data";

    // IF outputs
    wire [31:0] IF_Instruction, IF_PC4;
    
    // IF_ID outputs
    wire [31:0] IF_ID_Instruction, IF_ID_PC4;
    
    PipeReg #(32+32) IF_ID(
              .Clk(Clk),
              .Reset(Reset),
              .stall(ID_stall),
              .flush(ID_PCSrc),
              .in({IF_Instruction, IF_PC4}),
              .out({IF_ID_Instruction, IF_ID_PC4})
    );
    
    // Instruction Decode
    wire [31:0] ID_rs_val, ID_rt_val, ID_ext_imm;
    wire [4:0] ID_rt, ID_rd, ID_shamt;
    wire [3:0] ID_ALUControl;
    wire ID_R, ID_RegWrite, ID_MemWrite, ID_MemRead;
    wire ID_JALControl, ID_HalfControl, ID_ByteControl, ID_stall;
    wire ID_frame_shift, ID_window_shift;
    
    wire [31:0] ID_new_PC;
    wire ID_PCSrc;
    
    wire [31:0] ID_EX_PC4, ID_EX_rs_val, ID_EX_rt_val, ID_EX_ext_imm;
    wire [4:0] ID_EX_rt, ID_EX_rd, ID_EX_shamt;
    wire [3:0] ID_EX_ALUControl;
    wire ID_EX_R, ID_EX_RegWrite, ID_EX_MemWrite, ID_EX_MemRead;
    wire ID_EX_JALControl, ID_EX_HalfControl, ID_EX_ByteControl;
    wire ID_EX_frame_shift, ID_EX_window_shift;
    
    PipeReg #(32*4+5*3+4+7+2) ID_EX(
        .Clk(Clk),.Reset(Reset), 
        .stall(1'b0),
        .flush(ID_stall),
        .in({ID_JALControl, IF_ID_PC4,ID_rs_val,ID_rt_val,ID_ext_imm,ID_rt,ID_rd,ID_shamt,ID_ALUControl,ID_R,
        ID_RegWrite,ID_MemWrite,ID_MemRead,ID_HalfControl,ID_ByteControl, ID_frame_shift, ID_window_shift}),
        .out({ID_EX_JALControl, ID_EX_PC4,ID_EX_rs_val,ID_EX_rt_val,ID_EX_ext_imm,ID_EX_rt,ID_EX_rd,ID_EX_shamt,ID_EX_ALUControl,
        ID_EX_R,ID_EX_RegWrite,ID_EX_MemWrite,ID_EX_MemRead,
        ID_EX_HalfControl,ID_EX_ByteControl, ID_EX_frame_shift, ID_EX_window_shift})
    );
    
    
    // Execution
    wire [31:0] EX_ALUResult;
    wire [4:0] EX_WriteRegister;
    
    wire [31:0] EX_MEM_ALUResult, EX_MEM_rt_val;
    wire [4:0] EX_MEM_WriteRegister;
    wire EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_HalfControl;
    wire EX_MEM_ByteControl, EX_MEM_RegWrite;
    wire EX_MEM_frame_shift, EX_MEM_window_shift;
    
    PipeReg #(5+32*2+5+2) EX_MEM(
        .Clk(Clk),.Reset(Reset), 
        .stall(1'b0),
        .flush(1'b0),
        .in({EX_WriteRegister,EX_ALUResult,ID_EX_rt_val,ID_EX_MemRead,ID_EX_MemWrite,ID_EX_HalfControl,ID_EX_ByteControl,ID_EX_RegWrite, ID_EX_frame_shift, ID_EX_window_shift}),
        .out({EX_MEM_WriteRegister,EX_MEM_ALUResult,EX_MEM_rt_val,EX_MEM_MemRead,EX_MEM_MemWrite,EX_MEM_HalfControl,EX_MEM_ByteControl,EX_MEM_RegWrite, EX_MEM_frame_shift, EX_MEM_window_shift})
    );
    
    // Memory
    wire [31:0] MEM_ReadData;
    
    
    wire [31:0] MEM_SAD_ReadData;
    wire [4:0] MEM_SAD_WriteRegister;
    wire [31:0] MEM_SAD_ALUResult;
    wire MEM_SAD_RegWrite, MEM_SAD_MemRead;
    wire MEM_SAD_frame_shift, MEM_SAD_window_shift;
    
    PipeReg #(32*2+5+2+2) MEM_SAD(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({MEM_ReadData,EX_MEM_WriteRegister,EX_MEM_ALUResult,EX_MEM_RegWrite,EX_MEM_MemRead, EX_MEM_frame_shift, EX_MEM_window_shift}),
        .out({MEM_SAD_ReadData,MEM_SAD_WriteRegister,MEM_SAD_ALUResult,MEM_SAD_RegWrite,MEM_SAD_MemRead, MEM_SAD_frame_shift, MEM_SAD_window_shift})
    );
    
    // SAD
    wire [31:0] SAD_value;
    
    wire [31:0] SAD_WB_ReadData;
    wire [4:0] SAD_WB_WriteRegister;
    wire [31:0] SAD_WB_ALUResult;
    wire SAD_WB_RegWrite, SAD_WB_MemRead;
    wire [31:0] SAD_WB_value;
    wire SAD_WB_frame_shift;
    
    
    PipeReg #(32*3+5+2+1) SAD_WB(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({MEM_SAD_ReadData,MEM_SAD_WriteRegister,MEM_SAD_ALUResult,MEM_SAD_RegWrite,MEM_SAD_MemRead, SAD_value, MEM_SAD_frame_shift}),
        .out({SAD_WB_ReadData,SAD_WB_WriteRegister,SAD_WB_ALUResult,SAD_WB_RegWrite,SAD_WB_MemRead, SAD_WB_value, SAD_WB_frame_shift})
    );
    
    
    // Write Back
    wire [31:0] WB_WriteData;
    
    
    InstructionFetchUnit p0(
        .Clk(Clk),
        .Reset(Reset), 
        
        .ID_PCSrc(ID_PCSrc),
        .ID_new_PC(ID_new_PC),
        .ID_stall(ID_stall),
        
        .IF_Instruction(IF_Instruction),
        .IF_PC4(IF_PC4)
    ); 
    
    InstructionDecodeUnit p1(
        .Clk(Clk),
        
        .WB_WriteData(WB_WriteData),
        .MEM_WB_WriteRegister(SAD_WB_WriteRegister),
        .MEM_WB_RegWrite(SAD_WB_RegWrite),
        .IF_ID_PC4(IF_ID_PC4),
        .IF_ID_Instruction(IF_ID_Instruction),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .MEM_SAD_RegWrite(MEM_SAD_RegWrite),
        .EX_WriteRegister(EX_WriteRegister),
        .EX_MEM_WriteRegister(EX_MEM_WriteRegister),
        .MEM_SAD_WriteRegister(MEM_SAD_WriteRegister),
        
        .ID_rs_val(ID_rs_val),
        .ID_rt_val(ID_rt_val),
        .ID_ext_imm(ID_ext_imm), 
        .ID_rt(ID_rt),
        .ID_rd(ID_rd),
        .ID_ALUControl(ID_ALUControl),
        .ID_shamt(ID_shamt),
        .ID_R(ID_R),
        .ID_RegWrite(ID_RegWrite),
        .ID_MemWrite(ID_MemWrite),
        .ID_MemRead(ID_MemRead),
        .ID_HalfControl(ID_HalfControl),
        .ID_ByteControl(ID_ByteControl),
        .ID_PCSrc(ID_PCSrc),
        .ID_new_PC(ID_new_PC),
        .ID_JALControl(ID_JALControl),
        .ID_stall(ID_stall),
        
        .ID_frame_shift(ID_frame_shift),
        .ID_window_shift(ID_window_shift)
    ); 
    
    ExecutionUnit p2(
        .ID_EX_rt(ID_EX_rt),
        .ID_EX_rd(ID_EX_rd),
        .ID_EX_rs_val(ID_EX_rs_val),
        .ID_EX_rt_val(ID_EX_rt_val),
        .ID_EX_shamt(ID_EX_shamt),
        .ID_EX_ext_imm(ID_EX_ext_imm),
        .ID_EX_ALUControl(ID_EX_ALUControl),
        .ID_EX_R(ID_EX_R),
        .ID_EX_JALControl(ID_EX_JALControl),
        .ID_EX_PC4(ID_EX_PC4),
        
        .EX_ALUResult(EX_ALUResult),
        .EX_WriteRegister(EX_WriteRegister)
    );

    MemoryUnit #(.memory_file(memory_file)) p3(
        .Clk(Clk),
        
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_rt_val(EX_MEM_rt_val),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .EX_MEM_HalfControl(EX_MEM_HalfControl),
        .EX_MEM_ByteControl(EX_MEM_ByteControl),
        
        .MEM_ReadData(MEM_ReadData)
    );
    
    SADUnit p4(
        .Clk(Clk),
        .Reset(Reset),
        .MEM_SAD_ReadData(MEM_SAD_ReadData),
        .frame_shift(MEM_SAD_frame_shift),
        .window_shift(MEM_SAD_window_shift),
        .SAD_value(SAD_value)
        );
    
    WriteBackUnit p5(
        .MEM_WB_ReadData(SAD_WB_ReadData),
        .MEM_WB_ALUResult(SAD_WB_ALUResult),
        .SAD_WB_value(SAD_WB_value),
        .MEM_WB_MemtoReg(SAD_WB_MemRead),
        .frame_shift(SAD_WB_frame_shift),
        .WB_WriteData(WB_WriteData)
    );
    
    assign out_PC = IF_PC4 - 4;
    
    always @(*) begin
    
        if(SAD_WB_RegWrite)
            out_write_data <= WB_WriteData;
        else
            out_write_data <= 32'b0;
    
    end
    
    initial begin
        out_v0 <= 32'b0;
        out_v1 <= 32'b0;
    end
    
    always@(posedge Clk) begin
    
        if(SAD_WB_RegWrite) begin
        
            if(SAD_WB_WriteRegister == 32'd2)
                 out_v0 <= WB_WriteData;
        
            if(SAD_WB_WriteRegister == 32'd3)
                 out_v1 <= WB_WriteData;
        
        end
    
    end
    
    
endmodule
