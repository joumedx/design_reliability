`timescale 1ns / 1ns
`include "full_adder.v"

module full_add_tb;
    // variables declaration.
    reg a, b, ci;
    wire co, s;

    // instantiation of the full_adder module
    full_adder fa(.a(a), .b(b), .ci(ci), .s(s), .co(co));
    
    // begin testing.
    initial begin
        // initialise inputs
        a  = 0;
        b  = 0;
        ci = 0;
        
        // monitor and disply on change
        $monitor("b = %d a = %d ci = %d => co = %d s = %d", b, a, ci, co, s);
        
        // save test results for visualisation
        $dumpfile("adder_tb.vcp");
        $dumpvars(0, full_add_tb);
        
        // Use a for loop to check all truth table entries
        for (integer i = 0; i < 8; i++) begin
            // assign the counter bits to inputs
            // to simulate the truth table
            b  = i[2];
            a  = i[1];
            ci = i[0];
            // pause execution for 10ns
            #10;
        end
    end
endmodule
