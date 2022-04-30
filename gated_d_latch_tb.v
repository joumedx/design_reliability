`timescale 1ns / 1ns
`include "gated_d_latch.v"

module gated_d_latch_tb;
    // simulation and visualisation variables
    reg d, clk;
    wire qa, qb;

    // instantiate the module
    gated_d_latch gdl(.d(d), .clk(clk), .qa(qa), .qb(qb));
    
    // begin testing
    initial begin
        // monitor and disply on change
        $monitor("clk = %d, d = %d => qa = %d, qb = %d",
                clk,
                d,
                qa,
                qb);
        
        // save test results for visualisation
        $dumpfile("gated_d_latch_tb.vcp");
        $dumpvars(0, gated_d_latch_tb);
        
        clk  = 0;
        
        for (integer i = 0; i < 40; i++) begin
            // toggles clk
            clk = ~clk;
            // assign random value (0 or 1)
            d   = $random;
            #10;
        end
    end
endmodule
