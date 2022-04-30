`timescale 1ns / 1ns
`include "gated_d_latch.v"

module gated_d_latch_tt_tb;
    // simulation and visualisation variables
    reg d, clk;
    wire qa, qb;
    reg [5:0] clks, ds;

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
        $dumpfile("gated_d_latch_tt_tb.vcp");
        $dumpvars(0, gated_d_latch_tt_tb);

        clks = 6'b001100;
        ds   = 6'b101010;

        for (integer i = 0; i < 6; i++) begin
            // assign next value
            clk = clks[i];
            // assign next value
            d   = ds[i];
            #10;
        end
    end
endmodule

