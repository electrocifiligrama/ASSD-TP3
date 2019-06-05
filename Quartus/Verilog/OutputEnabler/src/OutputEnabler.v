//Modulo que simula un driver tristate
//Cuando Out_enable esta en 0 logico, pone
//la salida en alta impedancia, sino funciona como cable.
module OutputEnabler(
  input_bus,
  output_bus,
  Out_enable
);
parameter BUS_SIZE = 8;
input [BUS_SIZE-1:0] input_bus;
input Out_enable;
output [BUS_SIZE-1:0] output_bus;
assign output_bus = (Out_enable==0)?'bz:input_bus;

endmodule // OutputEnabler