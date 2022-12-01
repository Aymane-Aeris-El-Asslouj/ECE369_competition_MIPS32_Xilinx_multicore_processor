`timescale 1ns / 1ps
`default_nettype none

module RegisterFile(rs, rt, MEM_WB_WriteRegister, WB_WriteData, MEM_WB_RegWrite,
                    Clk, inner_rs_val, inner_rt_val,
                    
                    my_v0, my_v1);

	/* Please fill in the implementation here... */
	input [4:0] rs, rt, MEM_WB_WriteRegister; 
	input [31:0] WB_WriteData; 
	input wire MEM_WB_RegWrite, Clk;
	 
	reg [31:0] regFile [31:0]; 
	
	
	output wire [31:0] inner_rs_val, inner_rt_val;
	output reg [31:0] my_v0, my_v1; 
	
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
	
	always@(posedge Clk) begin
	   if(MEM_WB_RegWrite) begin
	       if(MEM_WB_WriteRegister == 5'd2) 
	           my_v0 <= WB_WriteData; 
	       if(MEM_WB_WriteRegister == 5'd3) 
	           my_v1 <= WB_WriteData; 
	   end
	end

endmodule
