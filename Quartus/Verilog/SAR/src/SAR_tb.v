//Testbench que se encarga de probar el modulo
//SAR

`timescale 1ms / 100us

module SAR_tb;
 wire clk_in;
 wire[7:0] result;
 wire comp;
 wire sh;
 wire start;
 wire eoc;
 reg[7:0] sampled_analog;
 clock_gen clk_inst(clk_in);
 NewStart start_inst(eoc,clk_in,start);
 SAR inst(start, clk_in, comp, result,sh,eoc);

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
   sampled_analog= 0;
   #5;
   sampled_analog = 200;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,SAR_tb);
    end

endmodule // SAR_tb
