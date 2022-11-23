`timescale 1ns / 1ps
`default_nettype none

module ExecutionUnit(ID_EX_rs_val, ID_EX_rt_val, ID_EX_rt, ID_EX_rd, ID_EX_shamt,
                    ID_EX_ext_imm, ID_EX_ALUControl, ID_EX_R,
                    ID_EX_JALControl, ID_EX_PC4,

                    EX_ALUResult, EX_WriteRegister);

    input [31:0] ID_EX_rs_val, ID_EX_rt_val, ID_EX_ext_imm, ID_EX_PC4;
    input [3:0] ID_EX_ALUControl;
    input [4:0] ID_EX_rt, ID_EX_rd, ID_EX_shamt;
    input wire ID_EX_R, ID_EX_JALControl;
    
    output reg [31:0] EX_ALUResult;
    wire [31:0] pre_ALUResult;
    output reg [4:0] EX_WriteRegister;
    
    reg [31:0] B;
    
    ALU32Bit e0(
        .ALUControl(ID_EX_ALUControl),
        .A(ID_EX_rs_val),
        .B(B),
        .shamt(ID_EX_shamt),
        .ALUResult(pre_ALUResult)
    );
    
    always@(*) begin
        case (ID_EX_R)
            1'b0: B <= ID_EX_ext_imm;
            1'b1: B <= ID_EX_rt_val; 
            default: B <= 32'bX;
        endcase
    end
    
    always@(*) begin
        case (ID_EX_JALControl)
            1'b0: EX_ALUResult <= pre_ALUResult;
            1'b1: EX_ALUResult <= ID_EX_PC4; 
            default: EX_ALUResult <= 32'bXXXX;
        endcase
    end
    
    always@(*) begin
        case(ID_EX_JALControl)
            1'b0: case (ID_EX_R)
                1'b0: EX_WriteRegister <= ID_EX_rt;
                1'b1: EX_WriteRegister <= ID_EX_rd; 
                default: EX_WriteRegister <= 5'bX;
            endcase
            1'b1: EX_WriteRegister <= 5'd31;
            default: EX_WriteRegister <= 5'bX;
        endcase
    end
    
endmodule
