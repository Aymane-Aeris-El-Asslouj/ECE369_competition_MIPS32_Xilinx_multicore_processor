`timescale 1ns / 1ps
`default_nettype none

module SADDUnit(KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4, SAD_value_small_A, SAD_value_small_B);

    input wire [9:0] KA1, KA2, KA3, KA4, KB1, KB2, KB3, KB4;
    
    output wire [12:0] SAD_value_small_A, SAD_value_small_B;
    
    assign SAD_value_small_A = KA1 + KA2 + KA3 + KA4;
    assign SAD_value_small_B = KB1 + KB2 + KB3 + KB4;
    
    
endmodule
