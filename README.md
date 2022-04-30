# Digital System Design & Reliability Engineering Assignment

## Software
- Icarus Verilog [site](http://iverilog.icarus.com/), Windows version available at [bleyer](https://bleyer.org/icarus/).
- GTKWave [site](http://gtkwave.sourceforge.net/), Windows version available at [sourceforge](https://sourceforge.net/projects/gtkwave/files/gtkwave-3.3.100-bin-win64/)
## Commands
```bash
# one liner compilation
iverilog -o output.vvp verilog_code_tb.v && vvp output.vvp

# a VCP file will be generated
# filename can be found in $dumpfile command
gtkwave -f output.vcp
```