/*
 * Module `ripple_carry_adder`
 *
 * Implementation of a four-bit ripple-carry adder
 * using the module `full_adder`  as a building block.
 */

`include "full_adder.v"

module ripple_carry_adder(output [4:0] ledr,
                          input [8:0] sw);
    // variables declaration
    wire [4:0] cout;
    assign cout[0] = sw[8];

    generate
        genvar i;
        // generate internal adder with a for loop
        // to avoid repeating the instantiation 4 times.
        for (i = 0; i < 4; i = i + 1) begin : generate_blocks
            full_adder fa(.a(sw[i + 4]),
                            .b(sw[i]),
                            .ci(cout[i]),
                            .s(ledr[i]),
                            .co(cout[i + 1]));
        end
    endgenerate
    
    assign ledr[4] = cout[4];
endmodule
