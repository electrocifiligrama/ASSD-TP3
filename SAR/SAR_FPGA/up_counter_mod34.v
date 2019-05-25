module up_counter_33(input clk, reset, output [4:0] counter);
reg [4:0] counter_up;

// up counter
always @(posedge clk or posedge reset) begin

	if(reset) begin
		counter_up <= 4'd0;
	end else begin
		counter_up <= counter_up + 4'd1;
		if (counter_up == 4b'1010) begin		//26
			counter_up <= 4'd0;
		end 
	end 
	assign counter = counter_up;
end 
endmodule