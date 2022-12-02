

`timescale 1ns / 1ps


module ForwardingUnit (input wire EX_MEM_special, MEM_SAD_special, SAD_SADD_special, SAD_SSAD_special, SAD_WB_special,
                        input wire [4:0] EX_MEM_WriteRegister, MEM_SAD_WriteRegister, SAD_SADD_WriteRegister, 
                        SAD_SSAD_WriteRegister, SAD_WB_WriteRegister,
                        input wire [4:0] ID_EX_rs, ID_EX_rt,
                        input wire [31:0] EX_MEM_ALUResult, MEM_SAD_ALUResult, SAD_SADD_ALUResult, SAD_SSAD_ALUResult, SAD_WB_ALUResult,
                        input wire [31:0] ID_EX_rs_val, ID_EX_rt_val,
                        output reg [31:0] forwarded_rs_val, forwarded_rt_val);
    
    
    
    
     always@(*) begin
        if(EX_MEM_special & (ID_EX_rs == EX_MEM_WriteRegister) & (ID_EX_rs != 5'b0))
            forwarded_rs_val <= EX_MEM_ALUResult;
        else if(MEM_SAD_special & (ID_EX_rs == MEM_SAD_WriteRegister) & (ID_EX_rs != 5'b0))
            forwarded_rs_val <= MEM_SAD_ALUResult;
        else if(SAD_SADD_special & (ID_EX_rs == SAD_SADD_WriteRegister) & (ID_EX_rs != 5'b0))
            forwarded_rs_val <= SAD_SADD_ALUResult;
        else if(SAD_SSAD_special & (ID_EX_rs == SAD_SSAD_WriteRegister) & (ID_EX_rs != 5'b0))
            forwarded_rs_val <= SAD_SSAD_ALUResult;
        else if(SAD_WB_special & (ID_EX_rs == SAD_WB_WriteRegister) & (ID_EX_rs != 5'b0))
            forwarded_rs_val <= SAD_WB_ALUResult;
        else 
            forwarded_rs_val <= ID_EX_rs_val;
	end
	
	always@(*) begin
        if(EX_MEM_special & (ID_EX_rt == EX_MEM_WriteRegister) & (ID_EX_rt != 5'b0))
            forwarded_rt_val <= EX_MEM_ALUResult;
        else if(MEM_SAD_special & (ID_EX_rt == MEM_SAD_WriteRegister) & (ID_EX_rt != 5'b0))
            forwarded_rt_val <= MEM_SAD_ALUResult;
        else if(SAD_SADD_special & (ID_EX_rt == SAD_SADD_WriteRegister) & (ID_EX_rt != 5'b0))
            forwarded_rt_val <= SAD_SADD_ALUResult;
        else if(SAD_SSAD_special & (ID_EX_rt == SAD_SSAD_WriteRegister) & (ID_EX_rt != 5'b0))
            forwarded_rt_val <= SAD_SSAD_ALUResult;
        else if(SAD_WB_special & (ID_EX_rt == SAD_WB_WriteRegister) & (ID_EX_rt != 5'b0))
            forwarded_rt_val <= SAD_WB_ALUResult;
        else 
            forwarded_rt_val <= ID_EX_rt_val;
	
	end
	
	
endmodule
