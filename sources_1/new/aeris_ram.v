// Dual-Port Block RAM with Two Write Ports

// File: rams_tdp_rf_rf.v

module aeris_ram (clka,clkb,ena,enb,wea,web,addra,addrb,dia,dib,doa,dob);

    parameter memories = "none_2.mem";

input wire clka,clkb,ena,enb,wea,web;

input [9:0] addra,addrb;

input [31:0] dia,dib;

output [31:0] doa,dob;

reg [31:0] ram [1023:0];

reg [31:0] doa,dob;

initial begin

$readmemh(memories, ram);

end

always @(posedge clka)

begin

if (ena)

begin

if (wea)

ram[addra] <= dia;

doa <= ram[addra];

end

end

always @(posedge clkb)

begin

if (enb)

begin

if (web)

ram[addrb] <= dib;

dob <= ram[addrb];

end

end

endmodule

