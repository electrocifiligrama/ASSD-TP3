//Testbench que se encarga de probar el modulo
//PseudoPll

`timescale 1ms / 100us

module PseudoPll_tb;
 wire clk_in;
 wire clk_out;
 reg[7:0] freq_param;
 clock_gen clk_inst(clk_in);
 PseudoPll inst(clk_in,freq_param ,clk_out);

 initial begin
   freq_param= 0;
   #5;
   freq_param= 50;
   #5;
   freq_param= 100;
   #5;
   freq_param= 150;
   #5;
   freq_param= 200;
   #5;
   freq_param= 255;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,PseudoPll_tb);
    end

endmodule // PseudoPll_tb
