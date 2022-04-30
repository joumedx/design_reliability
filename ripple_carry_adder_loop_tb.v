`timescale 1ns / 1ns
`include "ripple_carry_adder_loop.v"

module ripple_carry_adder_loop_tb; 
    // a = sw[7:4], b = sw[3:0], ci = sw[8]
    reg [8:0] sw; 
    wire [4:0] ledr;
    
    // for visualisation purposes
    wire [3:0] a = sw[7:4];
    wire [3:0] b = sw[3:0];
    wire ci = sw[8];
    wire co = ledr[4];
    wire [3:0] s = ledr[3:0];

    // instantiate ripple_carry_adder module.
    ripple_carry_adder rcal(.sw(sw), .ledr(ledr));

    // begin testing
    initial begin
        // initialise inputs
        sw = 0;
        // monitor and disply on change
        $monitor("b = %d, a = %d, ci = %d => ledr = %d",
                sw[3:0],
                sw[7:4],
                sw[8],
                ledr);
        
        // save test results for visualisation
        // change filename when changing ci (sw[8])
        // in line 46
        $dumpfile("ripple_carry_adder_loop_tb_0.vcp");
        $dumpvars(0, ripple_carry_adder_loop_tb);
        
        // Use a for loop to check all truth table entries
        for (integer i = 0; i < 16; i++) begin
            for (integer j = 0; j < 16; j++) begin
                // assign the counter bits to inputs
                // to simulate the truth table
                // setting the sw MSBs (a) to i
                sw[7:4] = i;
                // setting the sw LSBs (b) to j
                sw[3:0] = j;
                // setting ci to 0 or 1 depending on the test
                sw[8] = 0;
                // pause execution for 10ns
                #10;
            end
        end
    end
endmodule
