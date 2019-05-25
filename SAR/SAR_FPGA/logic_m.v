module logica (start, clk, cmp_in, data, sh, eoc);

output reg eoc, sh;
output reg [7:0]data;
input start, clk, cmp_in;
integer curr_bit;

reg reset;
reg [4:0] tick_count;
up_counter_33(clk, reset, tick_count);

initial begin
	reset <= 0;
	data <= 8'b10000000;
	eoc <= 0;
	sh <= 1;			//empieza a samplear
	curr_bit = 0;
end

always @ (posedge clk)begin
	
	if ((start == 1) or (eoc == 1)) begin
		eoc <= 0;
		data <= 8'b10000000;
		sh <= 1;			//empiezo a samplear
		reset <= 1;
		curr_bit = 0;
	end 
	else begin
		reset <= 0;
		eoc <= 0;
		if(tick_count >= 4'd8) begin
			sh <= 0;						//empiezo a holdear
			if(tick_count >= 4'd9) begin
				if (cmp_in == 0) begin
					data[curr_bit] = 0;
				end 
				else begin
					data[curr_bit] = 1;
				end 
				curr_bit = curr_bit + 1;
				if(curr_bit == 9) begin
					eoc <= 1;
				end
			end
		end 
	end 
end 
endmodule
