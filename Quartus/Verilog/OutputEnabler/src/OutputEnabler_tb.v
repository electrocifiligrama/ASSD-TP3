//Testbench que se encarga de probar el modulo
//OutputEnabler_tb

`timescale 1ms / 100us

module OutputEnabler_tb;
 reg[7:0] first_bus;
 wire[7:0] second_bus;
 reg oe;
 OutputEnabler inst(first_bus ,second_bus,oe);

 initial begin
   first_bus= 10;
   oe=0;
   #5;
   oe= 1;
   #5;
   oe= 0;
   #5;
   first_bus = 30;
   #5;
   first_bus= 80;
   #5;
   oe=1;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,OutputEnabler_tb);
    end

endmodule //OutputEnabler_tb
