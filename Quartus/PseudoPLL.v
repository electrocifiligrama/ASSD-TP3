//Modulo que recibe como entrada un clock de 1Mhz
//y devuelve un clock de una frecuencia definida por freq_param;
//la f_clk del ouput esta definida como:
//  f_clk= (MIN_CLK_STEP*freq_param)+F_CLK_MIN


module PseudoPll(
  clk_in,
  freq_param,
  clk_out
);
//Parametros
parameter F_CLK_MIN = 6000;
parameter F_CLK_MAX = 800000;
parameter MIN_CLK_STEP =(F_CLK_MAX-F_CLK_MIN)/255;

input wire clk_in;
input wire [7:0] freq_param;
output reg clk_out;
reg [15:0] counter;
reg a;
reg [31:0] desired_clk;
reg [31:0] edges_per_on_cycle;
initial begin
  counter=0;
  clk_out=0;
end


always @(posedge clk_in) begin
  desired_clk <= (MIN_CLK_STEP*freq_param)+F_CLK_MIN;
  edges_per_on_cycle <= 1/(desired_clk*(2/50000000));
  if (counter < (edges_per_on_cycle-1)) begin //Aumenta el contador con cada flanco ascendente
    counter <= counter +1;
  end
  else begin
    counter <=0;
    clk_out <= ~clk_out;
  end

end

endmodule // PseudoPll