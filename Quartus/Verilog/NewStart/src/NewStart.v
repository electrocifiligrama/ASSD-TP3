//Modulo que genera la nueva senal de
//start a partir de la senal EOC que
//recibe
module NewStart(
  EOC,
  clk,
  new_start
);
input EOC;
input clk;
output new_start;
Sustain inst(clk,EOC,new_start);
endmodule // NewStart