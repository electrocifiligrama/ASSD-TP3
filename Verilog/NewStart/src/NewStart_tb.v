//Testbench que se encarga de probar el modulo
//NewStart

`timescale 1us / 1ns

module NewStart_tb;
 reg EOC;
 wire new_start;
 wire clk_in;
 clock_gen clk_inst(clk_in);
 NewStart inst(EOC ,clk_in,new_start);

 initial begin
   EOC= 0;
   #5;
   EOC= 1;
   #5;
   EOC= 1;
   #5;
   EOC = 0;
   #5;
   EOC= 1;
   #5;
   EOC=0;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,NewStart_tb);
    end

endmodule //MuxSalida_tb
