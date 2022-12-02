`timescale 1ns / 1ps
`default_nettype none

module InstructionDecodeUnit(Clk, IF_ID_Instruction, WB_WriteData, MEM_WB_WriteRegister,
                            MEM_WB_RegWrite, IF_ID_PC4, ID_EX_RegWrite, EX_MEM_RegWrite, MEM_SAD_RegWrite, SAD_SADD_RegWrite, SAD_SSAD_RegWrite,
                            EX_WriteRegister, EX_MEM_WriteRegister, MEM_SAD_WriteRegister, SAD_SADD_WriteRegister, SAD_SSAD_WriteRegister,
                            
                            ID_frame_shift, ID_window_shift, ID_min_in, ID_buff,
                            
                            all_buf_flags, ID_load_buff_a, ID_load_buff_b,
                            
                            ID_load_min, ID_load_min_tag, ID_special,

                            ID_rs_val, ID_rt_val, ID_ext_imm, ID_rs, ID_rt, ID_rd,
                            ID_shamt, ID_R, ID_ALUControl,
                            ID_RegWrite, ID_MemWrite, ID_MemRead,
                            ID_HalfControl, ID_ByteControl, ID_JALControl,
                            ID_PCSrc, ID_new_PC, ID_stall,
                            
                            EX_MEM_special, MEM_SAD_special, SAD_SADD_special, SAD_SSAD_special, ID_EX_special, 
                            
                            
                            my_v0, my_v1);
                            

    input wire Clk;
    
    
    output wire ID_stall;
    
    input wire ID_EX_RegWrite, EX_MEM_RegWrite, MEM_SAD_RegWrite, SAD_SADD_RegWrite, SAD_SSAD_RegWrite;
    input wire [4:0] EX_WriteRegister, EX_MEM_WriteRegister, MEM_SAD_WriteRegister, SAD_SADD_WriteRegister, SAD_SSAD_WriteRegister;
    
    
    input wire [31:0] IF_ID_Instruction, WB_WriteData, IF_ID_PC4;
    input wire [4:0] MEM_WB_WriteRegister;
    input wire MEM_WB_RegWrite;
    
    input wire all_buf_flags;
    
    output wire [31:0] ID_rs_val, ID_rt_val, my_v0, my_v1;
    output reg [31:0] ID_new_PC;
    output wire [31:0] ID_ext_imm;
    output wire [4:0] ID_rs, ID_rt, ID_rd, ID_shamt;
    output wire [3:0] ID_ALUControl;
    output wire ID_R, ID_RegWrite, ID_MemWrite, ID_MemRead,
    ID_JALControl, ID_PCSrc, ID_HalfControl, ID_ByteControl;
    output wire ID_frame_shift, ID_window_shift, ID_min_in, ID_buff, ID_load_buff_a, ID_load_buff_b,
    ID_load_min, ID_load_min_tag, ID_special;
    
    input wire EX_MEM_special, MEM_SAD_special, SAD_SADD_special, SAD_SSAD_special, ID_EX_special;
    
    // Inner control signals for branching
    wire CompareResult;
    wire branch, JR;
    wire [2:0] CompareControl;
    
    wire [31:0] inner_rs_val, inner_rt_val;
    reg [31:0] bypass_rs_val, bypass_rt_val;
    wire [31:0] inner_ext_imm;
    
    // Split the instruction into its parts
    wire [5:0] opcode;
    assign opcode = IF_ID_Instruction[31:26];
    wire  [4:0] rs;
    assign rs = IF_ID_Instruction[25:21];
    wire [4:0] rt;
    assign rt = IF_ID_Instruction[20:16];
    assign ID_rd = IF_ID_Instruction[15:11];
    assign ID_shamt = IF_ID_Instruction[10:6];
    wire [5:0] funct;
    assign funct = IF_ID_Instruction[5:0];
    wire [15:0] imm;
    assign imm = IF_ID_Instruction[15:0];
    
    ControlUnit d0(
        .opcode(opcode),
        .funct(funct),
        .rt(rt),
        .rs(rs),
        .ID_ALUControl(ID_ALUControl),
        .ID_R(ID_R),
        .ID_RegWrite(ID_RegWrite),
        .ID_MemWrite(ID_MemWrite),
        .ID_MemRead(ID_MemRead),
        .ID_HalfControl(ID_HalfControl),
        .ID_ByteControl(ID_ByteControl),
        .branch(branch),
        .JR(JR),
        .ID_JALControl(ID_JALControl),
        .CompareControl(CompareControl),
        
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
        
        .EX_MEM_special(EX_MEM_special),
        .MEM_SAD_special(MEM_SAD_special),
        .SAD_SADD_special(SAD_SADD_special),
        .SAD_SSAD_special(SAD_SSAD_special),
        .ID_EX_special(ID_EX_special)
    );
    
    RegisterFile d1(
        .rs(rs), 
        .rt(rt), 
        .Clk(Clk), 
        .MEM_WB_WriteRegister(MEM_WB_WriteRegister), 
        .WB_WriteData(WB_WriteData), 
        .MEM_WB_RegWrite(MEM_WB_RegWrite), 
        .inner_rs_val(inner_rs_val), 
        .inner_rt_val(inner_rt_val),
        .my_v0(my_v0),
        .my_v1(my_v1)
    ); 
    
    assign inner_ext_imm = {{16{imm[15]}}, imm}; 
    assign ID_ext_imm = inner_ext_imm; 
    
    assign ID_rs = rs;
    assign ID_rt = rt;
    assign ID_rs_val = bypass_rs_val;
    assign ID_rt_val = bypass_rt_val;
    
    CompareUnit e0(
        .CompareControl(CompareControl),
        .A(bypass_rs_val),
        .B(bypass_rt_val),
        .CompareResult(CompareResult)
    );
    
    assign ID_PCSrc = (branch & CompareResult) | JR;
    
    always@(*) begin
        case (JR)
            1'b0: ID_new_PC <= (inner_ext_imm << 2) + IF_ID_PC4;
            1'b1: ID_new_PC <= bypass_rs_val;
            default: ID_new_PC <= 32'bX;
        endcase
    end
    
    
    always@(*) begin
        if(MEM_WB_RegWrite & (MEM_WB_WriteRegister == rs) & (rs != 5'b0))
            bypass_rs_val <= WB_WriteData;
        else
            bypass_rs_val <= inner_rs_val;
            
        
        if(MEM_WB_RegWrite & (MEM_WB_WriteRegister == rt) & (rt != 5'b0))
            bypass_rt_val <= WB_WriteData;
        else
            bypass_rt_val <= inner_rt_val;
    end
    
endmodule
