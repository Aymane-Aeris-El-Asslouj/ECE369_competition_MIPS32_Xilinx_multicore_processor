`timescale 1ns / 1ps
`default_nettype none

module WriteBackUnit(MEM_WB_ReadData, MEM_WB_ALUResult, MEM_WB_MemtoReg, WB_WriteData

    );
    
    input [31:0] MEM_WB_ReadData;
    input [31:0] MEM_WB_ALUResult;
    input wire MEM_WB_MemtoReg;
    
    output reg [31:0] WB_WriteData;
    
    always@(*) begin
        case (MEM_WB_MemtoReg)
            1'b0: WB_WriteData <= MEM_WB_ALUResult;
            1'b1: WB_WriteData <= MEM_WB_ReadData;
            default: WB_WriteData <= 32'bX;
        endcase
    end
    
endmodule
