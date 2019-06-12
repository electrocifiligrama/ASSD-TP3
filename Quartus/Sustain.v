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

reg[1:0] counter;
initial begin
  counter =0;
  new_start =0;
end


always @(posedge clk) begin
  if (in_signal) begin
	 new_start <= 1;
    counter <= counter + 1;
  end
  if (counter) begin
    new_start <= 0;
    counter <=0;
  end
end

endmodule // Sustain