
`timescale 1ns / 1ps
`default_nettype none

module DataMemory(Reset, EX_MEM_Address, EX_MEM_WriteData, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl,

                MEM_ReadData_A, MEM_ReadData_B, MEM_Address_2); 
    
    parameter memories = "none_2.mem";
    
    input wire Reset;

    input wire [31:0] EX_MEM_Address; 	// Input Address 
    input wire [31:0] EX_MEM_WriteData; // Data that needs to be written into the address 
    input wire Clk;
    input wire EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl; 
    
	//reg [31:0] Memory[0:127];
    
    //output reg[31:0] MEM_ReadData; // Contents of memory location at Address
    output wire [31:0] MEM_ReadData_A, MEM_ReadData_B; // Contents of memory location at Address
    wire [31:0] in_MEM_Address_2;
    assign in_MEM_Address_2 = EX_MEM_Address+EX_MEM_WriteData;
    output wire [31:0] MEM_Address_2;
    assign MEM_Address_2 = in_MEM_Address_2;
    //reg [31:0] ReadWord; //ReadWord_2;
    
    //aeris_ram #(.memories(memories)) ab(Clk, EX_MEM_Address[9:2], EX_MEM_Address[9:2]+EX_MEM_WriteData[9:2], EX_MEM_WriteData, MEM_ReadData_A, MEM_ReadData_B, EX_MEM_MemWrite);    
   //aeris_ram bc(Clk,1'b1,1'b1,EX_MEM_MemWrite,EX_MEM_Address[11:2],EX_MEM_Address[11:2]+EX_MEM_WriteData[11:2],MEM_ReadData_A,MEM_ReadData_B);
aeris_ram #(.memories(memories)) bc(~Clk,~Clk,1'b1,1'b1,EX_MEM_MemWrite,1'b0,EX_MEM_Address[11:2],in_MEM_Address_2[11:2],
EX_MEM_WriteData,32'b0,MEM_ReadData_A,MEM_ReadData_B);
endmodule
