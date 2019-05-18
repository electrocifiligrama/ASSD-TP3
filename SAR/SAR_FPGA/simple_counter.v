//a simple 32 bit-up counter
module simple_counter (input clock, output reg [31:0] counter_out);
//code starts here
always @ (posedge clock)		//on positive clock edges

begin 
	counter_out <= #1 counter_out + 1;		//increment counter
end
endmodule		//end of module center
