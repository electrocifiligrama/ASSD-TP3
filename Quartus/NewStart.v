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
reg in_signal;
Sustain inst(clk,in_signal,new_start);

initial begin
  in_signal =1;
end

always @(negedge EOC) begin
  in_signal <= 1;
end

endmodule // NewStart