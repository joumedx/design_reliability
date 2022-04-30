/*
 * Module `gated_d_latch`
 *
 * Implementation of a gated D latch.
 */

module gated_d_latch(output qa, qb,
                     input d, clk);
    wire sg, rg;
    
    nand(sg, d, clk);
    nand(rg, ~d, clk);
    
    nand(qa, qb, sg);
    nand(qb, qa, rg);
endmodule
