module up_counter_mod34(input clk, reset, output reg[4:0] counter_up);

// up counter
always @(posedge clk or posedge reset) begin

	if(reset) begin
		counter_up <= 4'd0;
	end 
	else begin
		counter_up <= counter_up + 4'd1;
		if (counter_up == 4'b 1010) begin		//26
			counter_up <= 4'd0;
		end 
	end 
end 
endmodule