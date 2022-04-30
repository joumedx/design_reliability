/*
 * Module `full_adder`
 *
 * 2 bits adder with carry input
 * Outputs 1 bit and a carry
 */

module full_adder(output s, co,
                  input a, b, ci);
    // output of XOR gate A
    wire ab_xor = a ^ b;
    // output of XOR gate B
    xor(s, ci, ab_xor);
    // Assign output co variable (Multiplexer)
    assign co = (ab_xor == 0) ? b : ci;
endmodule
