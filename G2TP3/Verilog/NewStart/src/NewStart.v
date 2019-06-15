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
output reg new_start;

reg[1:0] counter;
initial begin
  counter =0;
  new_start =1;
end

always @(negedge EOC) begin
  new_start <= 1;
  counter = 0;
end

always @(posedge clk) begin
  if (new_start) begin
    counter <= counter + 1;
  end
  if (counter) begin
    new_start <= 0;
    counter =0;
  end
end

endmodule // NewStart