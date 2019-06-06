//Modulo que implementa el counter
//para el modulador delta
module DeltaMod(
  comp_res,
  clk,
  counter
);
input comp_res;
input clk;
output reg[7:0] counter;
initial begin
  counter=0;
end

always @(posedge clk) begin
  if (comp_res) begin
    if (counter != 255) begin
      counter <= counter+1;
    end
  end
  else
    if (counter != 0) begin
      counter <= counter-1;
    end
end

endmodule // DeltaMod