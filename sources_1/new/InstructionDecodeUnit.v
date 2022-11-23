`timescale 1ns / 1ps
`default_nettype none

module InstructionDecodeUnit(Clk, IF_ID_Instruction, WB_WriteData, MEM_WB_WriteRegister,
                            MEM_WB_RegWrite, IF_ID_PC4, ID_EX_RegWrite, EX_MEM_RegWrite,
                            EX_WriteRegister, EX_MEM_WriteRegister,

                            ID_rs_val, ID_rt_val, ID_ext_imm, ID_rt, ID_rd,
                            ID_shamt, ID_R, ID_ALUControl,
                            ID_RegWrite, ID_MemWrite, ID_MemRead,
                            ID_HalfControl, ID_ByteControl, ID_JALControl,
                            ID_PCSrc, ID_new_PC, ID_stall);
                            

    input wire Clk;
    
    
    output wire ID_stall;
    
    input wire ID_EX_RegWrite, EX_MEM_RegWrite;
    input [4:0] EX_WriteRegister, EX_MEM_WriteRegister;
    
    
    input [31:0] IF_ID_Instruction, WB_WriteData, IF_ID_PC4;
    input [4:0] MEM_WB_WriteRegister;
    input wire MEM_WB_RegWrite;
    
    output [31:0] ID_rs_val, ID_rt_val;
    output reg [31:0] ID_new_PC;
    output [31:0] ID_ext_imm;
    output [4:0] ID_rt, ID_rd, ID_shamt;
    output [3:0] ID_ALUControl;
    output wire ID_R, ID_RegWrite, ID_MemWrite, ID_MemRead,
    ID_JALControl, ID_PCSrc, ID_HalfControl, ID_ByteControl;
    
    // Inner control signals for branching
    wire CompareResult;
    wire branch, force_branch, JR, J;
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
    wire [25:0] target_address;
    assign target_address = IF_ID_Instruction[25:0];
    
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
        .force_branch(force_branch),
        .JR(JR),
        .J(J),
        .ID_JALControl(ID_JALControl),
        .CompareControl(CompareControl),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .EX_WriteRegister(EX_WriteRegister),
        .EX_MEM_WriteRegister(EX_MEM_WriteRegister),
        .ID_stall(ID_stall)
    );
    
    RegisterFile d1(
        .rs(rs), 
        .rt(rt), 
        .Clk(Clk), 
        .MEM_WB_WriteRegister(MEM_WB_WriteRegister), 
        .WB_WriteData(WB_WriteData), 
        .MEM_WB_RegWrite(MEM_WB_RegWrite), 
        .inner_rs_val(inner_rs_val), 
        .inner_rt_val(inner_rt_val)
    ); 
    
    assign inner_ext_imm = {{16{imm[15]}}, imm}; 
    assign ID_ext_imm = inner_ext_imm; 
    
    assign ID_rt = rt;
    assign ID_rs_val = bypass_rs_val;
    assign ID_rt_val = bypass_rt_val;
    
    CompareUnit e0(
        .CompareControl(CompareControl),
        .A(bypass_rs_val),
        .B(bypass_rt_val),
        .CompareResult(CompareResult)
    );
    
    assign ID_PCSrc = (branch & CompareResult) | force_branch;
    
    always@(*) begin
        case (JR)
            1'b0: case (J)
                    1'b0: ID_new_PC <= (inner_ext_imm << 2) + IF_ID_PC4;
                    1'b1: ID_new_PC <= {IF_ID_PC4[31:28], target_address, 2'b00}; 
                    default: ID_new_PC <= 32'bX;
                endcase
            1'b1: ID_new_PC <= bypass_rs_val;
            default: ID_new_PC <= 32'bX;
        endcase
    end
    
    
    always@(*) begin
        if(MEM_WB_RegWrite & (MEM_WB_WriteRegister == rs))
            bypass_rs_val <= WB_WriteData;
        else
            bypass_rs_val <= inner_rs_val;
            
        
        if(MEM_WB_RegWrite & (MEM_WB_WriteRegister == rt))
            bypass_rt_val <= WB_WriteData;
        else
            bypass_rt_val <= inner_rt_val;
    end
    
endmodule
