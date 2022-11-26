`timescale 1ns / 1ps
`default_nettype none

module WriteBackUnit(MEM_WB_ReadData, MEM_WB_ALUResult, MEM_WB_MemtoReg, SAD_WB_value, WB_WriteData,
    load_min_tag
    );
    
    input [31:0] MEM_WB_ReadData, MEM_WB_ALUResult, SAD_WB_value;
    input wire MEM_WB_MemtoReg, load_min_tag;
    
    output reg [31:0] WB_WriteData;
    
    always@(*) begin
        case(load_min_tag)
            1'b0: 
                case (MEM_WB_MemtoReg)
                    1'b0: WB_WriteData <= MEM_WB_ALUResult;
                    1'b1: WB_WriteData <= MEM_WB_ReadData;
                    default: WB_WriteData <= 32'bX;
                endcase
            1'b1: WB_WriteData <= SAD_WB_value;
            default: WB_WriteData <= 32'bX;
        endcase
    end
    
endmodule
