`timescale 1ns / 1ps
`default_nettype none

module RegisterFile(rs, rt, MEM_WB_WriteRegister, WB_WriteData, MEM_WB_RegWrite,
                    Clk, inner_rs_val, inner_rt_val);

	/* Please fill in the implementation here... */
	input [4:0] rs, rt, MEM_WB_WriteRegister; 
	input [31:0] WB_WriteData; 
	input wire MEM_WB_RegWrite, Clk;
	 
	reg [31:0] regFile [31:0]; 
	
	
	output wire [31:0] inner_rs_val, inner_rt_val; 
	
    always@(posedge Clk) begin
	   if(MEM_WB_RegWrite && (MEM_WB_WriteRegister != 5'b0)) begin
	       regFile[MEM_WB_WriteRegister] <= WB_WriteData; 
	   end
	end
	
	initial begin
	   regFile[0] = 32'b0;
	end
	
	assign inner_rs_val = regFile[rs]; 
	assign inner_rt_val = regFile[rt]; 

endmodule
