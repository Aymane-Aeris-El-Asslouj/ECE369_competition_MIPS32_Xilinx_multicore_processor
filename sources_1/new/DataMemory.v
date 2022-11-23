`timescale 1ns / 1ps
`default_nettype none

module DataMemory(EX_MEM_Address, EX_MEM_WriteData, Clk, EX_MEM_MemWrite, EX_MEM_MemRead,
                EX_MEM_HalfControl, EX_MEM_ByteControl,

                MEM_ReadData); 

    input [31:0] EX_MEM_Address; 	// Input Address 
    input [31:0] EX_MEM_WriteData; // Data that needs to be written into the address 
    input wire Clk;
    input wire EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_HalfControl, EX_MEM_ByteControl; 
    integer i;              //used for indexing while initializing Memory array
    
	reg [31:0] Memory[0:8191];
    
    output reg[31:0] MEM_ReadData; // Contents of memory location at Address
    
    reg [31:0] ReadWord;
    
    wire HalfOffset;
    wire ByteOffset;
    reg [15:0] HalfWord;
    reg [7:0] Byte;
    /* Please fill in the implementation here */
    wire [12:0] core_address;
    assign core_address = EX_MEM_Address[14:2];
    
    initial begin

        $readmemh("data_memory.mem", Memory);
            
    end
    
    // Writes are positive triggered 
    always@(posedge Clk) begin
        if(EX_MEM_MemWrite) begin
            if(EX_MEM_HalfControl) begin
                if(HalfOffset)
                    Memory[core_address][31:16] <= EX_MEM_WriteData[15:0];
                else
                    Memory[core_address][15:0] <= EX_MEM_WriteData[15:0];
            end else if(EX_MEM_ByteControl) begin
                if(HalfOffset)
                    if(ByteOffset)
                        Memory[core_address][31:24] <= EX_MEM_WriteData[7:0];
                    else
                        Memory[core_address][23:16] <= EX_MEM_WriteData[7:0];
                else
                    if(ByteOffset)
                        Memory[core_address][15:8] <= EX_MEM_WriteData[7:0];
                    else
                        Memory[core_address][7:0] <= EX_MEM_WriteData[7:0];
            end else begin
                Memory[core_address] <= EX_MEM_WriteData;
            end 
        end
    end 
    
    always@(*) begin
        if(EX_MEM_MemRead) begin
            ReadWord <= Memory[core_address]; 
        end
        else begin
            ReadWord <= 32'bZZZZ; 
        end
    end
    
    assign HalfOffset = EX_MEM_Address[1];
    assign ByteOffset = EX_MEM_Address[0];
    
    always @(*) begin
        if(HalfOffset)
            HalfWord <= ReadWord[31:16];
        else
            HalfWord <= ReadWord[15:0];
    end
    
    always @(*) begin
        if(ByteOffset)
            Byte <= HalfWord[15:8];
        else
            Byte <= HalfWord[7:0];
    end
    
    always@(*) begin
    
        if(EX_MEM_HalfControl) begin
            MEM_ReadData <= {{16{HalfWord[15]}}, HalfWord};
        end else if (EX_MEM_ByteControl) begin
            MEM_ReadData <= {{24{Byte[7]}}, Byte};
        end else begin
            MEM_ReadData <= ReadWord;
        end
    end

endmodule
