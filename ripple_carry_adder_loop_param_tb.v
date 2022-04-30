`timescale 1ns / 1ns
`include "ripple_carry_adder_loop_param.v"

module ripple_carry_adder_loop_param_tb;
    parameter bits = 2;
    parameter hbits = bits - 1;
    parameter dbits = bits * 2;
    parameter hdbits = dbits - 1;

    reg [dbits:0] sw; 
    wire [bits:0] ledr;
    
    // for visualisation purposes
    wire [hbits:0] a = sw[hdbits:bits];
    wire [hbits:0] b = sw[hbits:0];
    wire [hbits:0] s = ledr[hbits:0];
    wire co = ledr[bits];
    wire ci = sw[dbits];

    n_ripple_carry_adder #(.bits(bits)) rcal(.sw(sw), .ledr(ledr));

    // begin testing
    initial begin
        // initialise inputs
        sw = 0;
        // monitor and disply on change
        $monitor("a = %d, b = %d, ci = %d => ledr = %d",
                sw[hdbits:bits],
                sw[hbits:0],
                ci,
                ledr);
        
        // save test results for visualisation
        $dumpfile("ripple_carry_adder_loop_param_tb.vcp");
        $dumpvars(0, ripple_carry_adder_loop_param_tb);
        
        // Use a for loop to check all truth table entries
        for (integer i = 0; i < (bits ** 2); i++) begin
            for (integer j = 0; j < (bits ** 2); j++) begin
                // assign the counter bits to inputs
                // to simulate the truth table
                sw[hdbits:bits] = i;
                sw[hbits:0] = j;
                sw[dbits] = 1;
                // pause execution for 10ns
                #10;
            end
        end
    end
endmodule
