//Testbench que se encarga de probar el modulo
//DeltaMod_tb

`timescale 1ms / 100us

module DeltaMod_tb;
 wire clk_in;
 wire[7:0] result;
 wire comp;
 reg[7:0] sampled_analog;
 clock_gen clk_inst(clk_in);
 DeltaMod inst(comp , clk_in, result);

 assign comp = sampled_analog > result;   

 initial begin
   sampled_analog= 0;
   #5;
   sampled_analog= 10;
   #5;
   sampled_analog= 30;
   #5;
   sampled_analog = 60;
   #5;
   sampled_analog= 10;
   #5;
   sampled_analog= -30;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,DeltaMod_tb);
    end

endmodule // DeltaMod_tb
