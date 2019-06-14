//Modulo que simula un mux de una
//linea de seleccion y dos entradas
module mux2(
  first_bus,
  second_bus,
  sel_line,
  output_bus
);
input first_bus;
input second_bus;
output output_bus;
input wire sel_line;
assign output_bus = (sel_line==0)?first_bus:second_bus;

endmodule // Mux2