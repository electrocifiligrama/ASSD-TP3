//Modulo que mantiene la senal
//prendida durante un ciclo de clock.
module Sustain(
  clk,
  in_signal,
  new_start
);
input clk;
input in_signal;
output reg new_start;

initial begin
  new_start =1;
end


always @(posedge clk) begin
  if (in_signal) begin
   new_start <= 1;
  end
  else begin
   new_start <= 0;
  end
end

endmodule // Sustain