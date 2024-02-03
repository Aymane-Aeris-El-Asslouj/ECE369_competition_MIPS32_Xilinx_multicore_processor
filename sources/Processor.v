// Aeris El Asslouj 100%
// Group 26
// 6 stage pipeline with branches in ID

`timescale 1ns / 1ps
`default_nettype none


module Processor(input wire Clk, Reset,
                output wire [31:0] out_v0, out_v1, out_s0,
                output reg out_write_data,
                output wire [31:0] out_PC, buf_val_1, buf_val_2,
                output wire buf_flag,
                
            output wire [4:0] buf_val_1_addr, buf_val_2_addr,
            input wire [31:0] buf_val_1_select, buf_val_2_select,
            input wire all_buf_flags
                );
                
    parameter memories = "none_2.mem";
    parameter instructions = "none.mem";

    // IF outputs
    wire [31:0] IF_Instruction, IF_PC4;
    
    // IF_ID outputs
    wire [31:0] IF_ID_Instruction, IF_ID_PC4;
    
    PipeReg #(32+32) IF_ID(
              .Clk(Clk),
              .Reset(Reset),
              .stall(ID_stall),
              //.flush(ID_PCSrc),
              .flush(1'b0),
              .in({IF_Instruction, IF_PC4}),
              .out({IF_ID_Instruction, IF_ID_PC4})
    );
    
    // Instruction Decode
    wire [31:0] ID_rs_val, ID_rt_val, ID_ext_imm;
    wire [4:0] ID_rs, ID_rt, ID_rd, ID_shamt;
    wire [3:0] ID_ALUControl;
    wire ID_R, ID_RegWrite, ID_MemWrite, ID_MemRead;
    wire ID_JALControl, ID_HalfControl, ID_ByteControl, ID_stall;
    wire ID_frame_shift, ID_window_shift, ID_min_in, ID_buff, ID_load_buff_a, ID_load_buff_b,
    ID_EX_load_min, ID_EX_load_min_tag, ID_special;
    
    wire [31:0] ID_new_PC;
    wire ID_PCSrc;
    
    wire [31:0] ID_EX_PC4, ID_EX_rs_val, ID_EX_rt_val, ID_EX_ext_imm;
    wire [4:0] ID_EX_rs, ID_EX_rt, ID_EX_rd, ID_EX_shamt;
    wire [3:0] ID_EX_ALUControl;
    wire ID_EX_R, ID_EX_RegWrite, ID_EX_MemWrite, ID_EX_MemRead;
    wire ID_EX_JALControl, ID_EX_HalfControl, ID_EX_ByteControl;
    wire ID_EX_frame_shift, ID_EX_window_shift, ID_EX_min_in, ID_EX_load_buff_a, ID_EX_load_buff_b,
    ID_load_min, ID_load_min_tag, ID_EX_special;
    
    PipeReg #(32*4+5*3+4+7+2+2+1+2+1+5) ID_EX(
        .Clk(Clk),.Reset(Reset), 
        .stall(1'b0),
        .flush(ID_stall),
        .in({ID_JALControl, IF_ID_PC4,ID_rs_val,ID_rt_val,ID_ext_imm,ID_rs,ID_rt,ID_rd,ID_shamt,ID_ALUControl,ID_R,
        ID_RegWrite,ID_MemWrite,ID_MemRead,ID_HalfControl,ID_ByteControl, ID_frame_shift, ID_window_shift, ID_min_in, 
        ID_load_buff_a, ID_load_buff_b,
        ID_load_min, ID_load_min_tag, ID_special}),
        .out({ID_EX_JALControl, ID_EX_PC4,ID_EX_rs_val,ID_EX_rt_val,ID_EX_ext_imm,ID_EX_rs,ID_EX_rt,ID_EX_rd,ID_EX_shamt,ID_EX_ALUControl,
        ID_EX_R,ID_EX_RegWrite,ID_EX_MemWrite,ID_EX_MemRead,
        ID_EX_HalfControl,ID_EX_ByteControl, ID_EX_frame_shift, ID_EX_window_shift, ID_EX_min_in, ID_EX_load_buff_a, ID_EX_load_buff_b,
        ID_EX_load_min, ID_EX_load_min_tag, ID_EX_special})
    );
    
    
    // Execution
    wire [31:0] EX_ALUResult;
    wire [4:0] EX_WriteRegister;
    
    wire [31:0] EX_MEM_ALUResult, EX_MEM_rt_val;
    wire [4:0] EX_MEM_WriteRegister;
    wire EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_HalfControl;
    wire EX_MEM_ByteControl, EX_MEM_RegWrite;
    wire EX_MEM_frame_shift, EX_MEM_window_shift, EX_MEM_min_in, EX_MEM_load_buff_a, EX_MEM_load_buff_b,
    EX_MEM_load_min, EX_MEM_load_min_tag, EX_MEM_special;
    
    PipeReg #(5+32*2+5+2+2+1+2+1) EX_MEM(
        .Clk(Clk),.Reset(Reset), 
        .stall(1'b0),
        .flush(1'b0),
        .in({EX_WriteRegister,EX_ALUResult,ID_EX_rt_val,ID_EX_MemRead,ID_EX_MemWrite,ID_EX_HalfControl,
        ID_EX_ByteControl,ID_EX_RegWrite, ID_EX_frame_shift, ID_EX_window_shift, ID_EX_min_in,
        ID_EX_load_buff_a, ID_EX_load_buff_b, ID_EX_load_min, ID_EX_load_min_tag, ID_EX_special}),
        .out({EX_MEM_WriteRegister,EX_MEM_ALUResult,EX_MEM_rt_val,EX_MEM_MemRead,EX_MEM_MemWrite,
        EX_MEM_HalfControl,EX_MEM_ByteControl,EX_MEM_RegWrite, EX_MEM_frame_shift, EX_MEM_window_shift, EX_MEM_min_in,
        EX_MEM_load_buff_a, EX_MEM_load_buff_b, EX_MEM_load_min, EX_MEM_load_min_tag, EX_MEM_special})
    );
    
    // Memory
    wire [31:0] MEM_ReadData_A, MEM_ReadData_B;
    wire [9:0] MEM_Address_2;
    
    
    wire [31:0] MEM_SAD_ReadData_A, MEM_SAD_ReadData_B;
    wire [9:0] MEM_SAD_Address_2;
    wire [4:0] MEM_SAD_WriteRegister;
    wire [31:0] MEM_SAD_ALUResult;
    wire MEM_SAD_RegWrite, MEM_SAD_MemRead;
    wire MEM_SAD_frame_shift, MEM_SAD_window_shift, MEM_SAD_min_in,
    MEM_SAD_load_min, MEM_SAD_load_min_tag, MEM_SAD_special;
    
    PipeReg #(32*2+5+2+2+1+2+32+1+10) MEM_SAD(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({MEM_ReadData_A, MEM_ReadData_B,EX_MEM_WriteRegister,EX_MEM_ALUResult,EX_MEM_RegWrite,EX_MEM_MemRead,
        EX_MEM_frame_shift, EX_MEM_window_shift, EX_MEM_min_in, EX_MEM_load_min, EX_MEM_load_min_tag, EX_MEM_special, MEM_Address_2}),
        .out({MEM_SAD_ReadData_A, MEM_SAD_ReadData_B,MEM_SAD_WriteRegister,MEM_SAD_ALUResult,MEM_SAD_RegWrite,MEM_SAD_MemRead,
        MEM_SAD_frame_shift, MEM_SAD_window_shift, MEM_SAD_min_in, MEM_SAD_load_min, MEM_SAD_load_min_tag, MEM_SAD_special, MEM_SAD_Address_2})
    );
    
    // Memory
    wire [9:0] KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4;
    
    
    wire [31:0] SAD_SADD_ReadData_A;
    wire [9:0] SAD_SADD_Address_2;
    wire [4:0] SAD_SADD_WriteRegister;
    wire [31:0] SAD_SADD_ALUResult;
    wire SAD_SADD_RegWrite, SAD_SADD_MemRead;
    wire SAD_SADD_frame_shift, SAD_SADD_window_shift, SAD_SADD_min_in,
    SAD_SADD_load_min, SAD_SADD_load_min_tag, SAD_SADD_special;
    
    wire [9:0] SAD_SADD_KA1, SAD_SADD_KA2, SAD_SADD_KA3, SAD_SADD_KA4, SAD_SADD_KB1, SAD_SADD_KB2, SAD_SADD_KB3, SAD_SADD_KB4;
    
    PipeReg #(32+5+2+2+1+2+32+10*8+1+10) SAD_SADD(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({MEM_SAD_ReadData_A, MEM_SAD_WriteRegister,MEM_SAD_ALUResult,MEM_SAD_RegWrite,MEM_SAD_MemRead,
        MEM_SAD_frame_shift, MEM_SAD_window_shift, MEM_SAD_min_in, MEM_SAD_load_min, MEM_SAD_load_min_tag,
        KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4, MEM_SAD_special, MEM_SAD_Address_2}),
        .out({SAD_SADD_ReadData_A, SAD_SADD_WriteRegister,SAD_SADD_ALUResult,SAD_SADD_RegWrite,SAD_SADD_MemRead,
        SAD_SADD_frame_shift, SAD_SADD_window_shift, SAD_SADD_min_in, SAD_SADD_load_min, SAD_SADD_load_min_tag,
        SAD_SADD_KA1, SAD_SADD_KA2, SAD_SADD_KA3, SAD_SADD_KA4, SAD_SADD_KB1, SAD_SADD_KB2, SAD_SADD_KB3, SAD_SADD_KB4,
        SAD_SADD_special, SAD_SADD_Address_2})
    );
    
    
    
    
    wire [12:0] SAD_value_small_A, SAD_value_small_B;
    
    
    wire [31:0] SAD_SSAD_ReadData_A;
    wire [9:0] SAD_SSAD_Address_2;
    wire [4:0] SAD_SSAD_WriteRegister;
    wire [31:0] SAD_SSAD_ALUResult;
    wire SAD_SSAD_RegWrite, SAD_SSAD_MemRead;
    wire SAD_SSAD_frame_shift, SAD_SSAD_window_shift, SAD_SSAD_min_in,
    SAD_SSAD_load_min, SAD_SSAD_load_min_tag, SAD_SSAD_special;
    wire [12:0] SAD_SSAD_value_small_A, SAD_SSAD_value_small_B;
    
    PipeReg #(32+5+2+2+1+2+32+13*2+1+10) SAD_SSAD(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({SAD_SADD_ReadData_A, SAD_SADD_WriteRegister,SAD_SADD_ALUResult,SAD_SADD_RegWrite,SAD_SADD_MemRead,
        SAD_SADD_frame_shift, SAD_SADD_window_shift, SAD_SADD_min_in, SAD_SADD_load_min, SAD_SADD_load_min_tag,
        SAD_value_small_A, SAD_value_small_B, SAD_SADD_special, SAD_SADD_Address_2}),
        .out({SAD_SSAD_ReadData_A, SAD_SSAD_WriteRegister,SAD_SSAD_ALUResult,SAD_SSAD_RegWrite,SAD_SSAD_MemRead,
        SAD_SSAD_frame_shift, SAD_SSAD_window_shift, SAD_SSAD_min_in, SAD_SSAD_load_min, SAD_SSAD_load_min_tag,
        SAD_SSAD_value_small_A, SAD_SSAD_value_small_B, SAD_SSAD_special, SAD_SSAD_Address_2})
    );
    
    // SAD
    wire [31:0] SAD_value;
    
    wire [31:0] SAD_WB_ReadData;
    wire [4:0] SAD_WB_WriteRegister;
    wire [31:0] SAD_WB_ALUResult;
    wire SAD_WB_RegWrite, SAD_WB_MemRead;
    wire [31:0] SAD_WB_value;
    wire SAD_WB_load_min_tag, SAD_WB_special;
    
    
    PipeReg #(32*3+5+2+1+1) SAD_WB(
        .Clk(Clk),.Reset(Reset),
        .stall(1'b0),
        .flush(1'b0),
        .in({SAD_SSAD_ReadData_A,SAD_SSAD_WriteRegister,SAD_SSAD_ALUResult,SAD_SSAD_RegWrite,SAD_SSAD_MemRead, 
        SAD_value, SAD_SSAD_load_min_tag, SAD_SSAD_special}),
        .out({SAD_WB_ReadData,SAD_WB_WriteRegister,SAD_WB_ALUResult,SAD_WB_RegWrite,SAD_WB_MemRead, 
        SAD_WB_value, SAD_WB_load_min_tag, SAD_WB_special})
    );
    
    
    // Write Back
    wire [31:0] WB_WriteData;
    
    
    
    // forwarding
    
    wire [31:0] forwarded_rs_val, forwarded_rt_val;
    
    
    InstructionFetchUnit #(.instructions(instructions)) p0(
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
        .SAD_SADD_RegWrite(SAD_SADD_RegWrite),
        .SAD_SSAD_RegWrite(SAD_SSAD_RegWrite),
        
        .EX_WriteRegister(EX_WriteRegister),
        .EX_MEM_WriteRegister(EX_MEM_WriteRegister),
        .MEM_SAD_WriteRegister(MEM_SAD_WriteRegister),
        .SAD_SADD_WriteRegister(SAD_SADD_WriteRegister),
        .SAD_SSAD_WriteRegister(SAD_SSAD_WriteRegister),
        
        .ID_rs_val(ID_rs_val),
        .ID_rt_val(ID_rt_val),
        .ID_ext_imm(ID_ext_imm), 
        .ID_rs(ID_rs),
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
        .ID_window_shift(ID_window_shift),
        .ID_min_in(ID_min_in),
        .ID_buff(ID_buff),
        
        .all_buf_flags(all_buf_flags),
        .ID_load_buff_a(ID_load_buff_a),
        .ID_load_buff_b(ID_load_buff_b),
        
        .ID_load_min(ID_load_min),
        .ID_load_min_tag(ID_load_min_tag),
        .ID_special(ID_special),
        
        .my_v0(out_v0),
        .my_v1(out_v1),
        .my_s0(out_s0),
        
        .EX_MEM_special(EX_MEM_special),
        .MEM_SAD_special(MEM_SAD_special),
        .SAD_SADD_special(SAD_SADD_special),
        .SAD_SSAD_special(SAD_SSAD_special),
        .ID_EX_special(ID_EX_special)
    ); 
    
    ExecutionUnit p2(
        .ID_EX_rt(ID_EX_rt),
        .ID_EX_rd(ID_EX_rd),
        .ID_EX_rs_val(forwarded_rs_val),
        .ID_EX_rt_val(forwarded_rt_val),
        .ID_EX_shamt(ID_EX_shamt),
        .ID_EX_ext_imm(ID_EX_ext_imm),
        .ID_EX_ALUControl(ID_EX_ALUControl),
        .ID_EX_R(ID_EX_R),
        .ID_EX_JALControl(ID_EX_JALControl),
        .ID_EX_PC4(ID_EX_PC4),
        
        .EX_ALUResult(EX_ALUResult),
        .EX_WriteRegister(EX_WriteRegister)
    );

    MemoryUnit #(.memories(memories)) p3(
        .Clk(Clk),
        .Reset(Reset),
        
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_rt_val(EX_MEM_rt_val),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .EX_MEM_HalfControl(EX_MEM_HalfControl),
        .EX_MEM_ByteControl(EX_MEM_ByteControl),
        
        .EX_MEM_load_buff_a(EX_MEM_load_buff_a),
        .EX_MEM_load_buff_b(EX_MEM_load_buff_b),
        .buf_val_1_addr(buf_val_1_addr),
        .buf_val_2_addr(buf_val_2_addr),
        .buf_val_1_select(buf_val_1_select),
        .buf_val_2_select(buf_val_2_select),
        
        .MEM_ReadData_A(MEM_ReadData_A),
        .MEM_ReadData_B(MEM_ReadData_B),
        .MEM_Address_2(MEM_Address_2)
    );
    
    SADUnit p4(
        .Clk(Clk),
        .MEM_SAD_ReadData_A(MEM_SAD_ReadData_A),
        .MEM_SAD_ReadData_B(MEM_SAD_ReadData_B),
        .frame_shift(MEM_SAD_frame_shift),
        .window_shift(MEM_SAD_window_shift),
        .KA1(KA1),
        .KA2(KA2),
        .KA3(KA3),
        .KA4(KA4),
        .KB1(KB1),
        .KB2(KB2),
        .KB3(KB3),
        .KB4(KB4)
        );
    
    SADDUnit p5(SAD_SADD_KA1, SAD_SADD_KA2, SAD_SADD_KA3, SAD_SADD_KA4, SAD_SADD_KB1, SAD_SADD_KB2, SAD_SADD_KB3, SAD_SADD_KB4,
     SAD_value_small_A, SAD_value_small_B);
        
        
    
    SSADUnit p6(
        .Clk(Clk),
        .Reset(Reset),
        .MEM_SAD_ReadData_A(SAD_SSAD_ReadData_A),
        .SAD_value_small_A(SAD_SSAD_value_small_A),
        .SAD_value_small_B(SAD_SSAD_value_small_B),
        .frame_shift(SAD_SSAD_frame_shift),
        .window_shift(SAD_SSAD_window_shift),
        .SAD_value(SAD_value),
        .min_in(SAD_SSAD_min_in),
        .MEM_SAD_ALUResult(SAD_SSAD_ALUResult),
        .MEM_SAD_ALUResult_2(SAD_SSAD_Address_2),
        .load_min(SAD_SSAD_load_min)
        );
        
    
    WriteBackUnit p7(
        .MEM_WB_ReadData(SAD_WB_ReadData),
        .MEM_WB_ALUResult(SAD_WB_ALUResult),
        .SAD_WB_value(SAD_WB_value),
        .MEM_WB_MemtoReg(SAD_WB_MemRead),
        .load_min_tag(SAD_WB_load_min_tag),
        .WB_WriteData(WB_WriteData)
    );
    
    BufReg b1(.Clk(Clk),
              .stall(ID_stall),
              .Reset(Reset),
              .write(ID_buff),
              .in_1(ID_rs_val),
              .in_2(ID_rt_val),
              .out_1(buf_val_1),
              .out_2(buf_val_2),
              .flag(buf_flag));
              
              
     ForwardingUnit f1(.EX_MEM_special(EX_MEM_special),
                    .MEM_SAD_special(MEM_SAD_special),
                    .SAD_SADD_special(SAD_SADD_special),
                    .SAD_SSAD_special(SAD_SSAD_special),
                    .SAD_WB_special(SAD_WB_special),
                    .EX_MEM_WriteRegister(EX_MEM_WriteRegister),
                    .MEM_SAD_WriteRegister(MEM_SAD_WriteRegister),
                    .SAD_SADD_WriteRegister(SAD_SADD_WriteRegister),
                    .SAD_SSAD_WriteRegister(SAD_SSAD_WriteRegister),
                    .SAD_WB_WriteRegister(SAD_WB_WriteRegister),
                    .ID_EX_rs(ID_EX_rs),
                    .ID_EX_rt(ID_EX_rt),
                    .EX_MEM_ALUResult(EX_MEM_ALUResult),
                    .MEM_SAD_ALUResult(MEM_SAD_ALUResult),
                    .SAD_SADD_ALUResult(SAD_SADD_ALUResult),
                    .SAD_SSAD_ALUResult(SAD_SSAD_ALUResult),
                     .SAD_WB_ALUResult(SAD_WB_ALUResult),
                     .ID_EX_rs_val(ID_EX_rs_val),
                    .ID_EX_rt_val(ID_EX_rt_val),
                    .forwarded_rs_val(forwarded_rs_val),
                     .forwarded_rt_val(forwarded_rt_val)
                      );
              
              
              
              
              
              
    
    assign out_PC = IF_PC4 - 4;
    
    always @(*) begin
    
        if(SAD_WB_RegWrite)
            out_write_data <= WB_WriteData;
        else
            out_write_data <= 32'b0;
    
    end
    
   // assign my_stored = MEM_ReadData_A;
//    initial begin
//        out_v0 <= 32'h0;
//        out_v1 <= 32'h0;
//    end
    
//    always@(posedge Clk) begin
    
//        if(SAD_WB_RegWrite) begin
        
//            if(SAD_WB_WriteRegister == 5'd2)
//            //if(SAD_WB_WriteRegister == 32'd2)
//                 out_v0 <= WB_WriteData;
        
//            if(SAD_WB_WriteRegister == 5'd16)
//                 out_v1 <= WB_WriteData;
        
//        end
    
//    end
    
    
endmodule
