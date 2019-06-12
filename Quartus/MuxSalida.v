//Modulo que simula un mux de una
//linea de seleccion y dos buses de entrada de
//8 bits cada uno
module MuxSalida(
  first_bus,
  second_bus,
  sel_line,
  output_bus
);
parameter BUS_SIZE = 8;
input[BUS_SIZE-1:0] first_bus;
input [BUS_SIZE-1:0] second_bus;
output [BUS_SIZE-1:0] output_bus;
input wire sel_line;
assign output_bus = (sel_line==0)?first_bus:second_bus;

endmodule // DeltaMod