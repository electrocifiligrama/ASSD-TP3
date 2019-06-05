//Testbench que se encarga de probar el modulo
//MuxSalida_tb

`timescale 1ms / 100us

module MuxSalida_tb;
 wire[7:0] result;
 reg[7:0] first_bus;
 reg[7:0] second_bus;
 reg sel;
 MuxSalida inst(first_bus ,second_bus,sel, result);

 initial begin
   first_bus= 10;
   second_bus = 50;
   sel=0;
   #5;
   sel= 1;
   #5;
   sel= 0;
   #5;
   first_bus = 30;
   #5;
   first_bus= 80;
   #5;
   sel=1;
   #5;
   $finish;
 end

 reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";

    initial begin
        dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,MuxSalida_tb);
    end

endmodule //MuxSalida_tb
