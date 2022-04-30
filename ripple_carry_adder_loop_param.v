/*
 * Module `n_ripple_carry_adder`
 *
 * Implementation of a N-bit ripple
 *.carry adder using the module `full_adder`
 * as a building block.
 */

`include "full_adder.v"

module n_ripple_carry_adder #(parameter bits = 4)
                            (output [bits:0] ledr,
                            input [bits*2:0] sw);
    // variables declaration
    wire [bits:0] cout;
    assign cout[0] = sw[bits * 2];
    
    generate
    genvar i;
        // generate internal adder with a for loop
        // to avoid repeating the instantiation 4 times.
        for (i = 0; i < bits; i = i + 1) begin : generate_blocks
            full_adder fa(.a(sw[i + bits]),
                          .b(sw[i]),
                          .ci(cout[i]),
                          .s(ledr[i]),
                          .co(cout[i + 1]));
        end
    endgenerate
    
    assign ledr[bits] = cout[bits];
endmodule
