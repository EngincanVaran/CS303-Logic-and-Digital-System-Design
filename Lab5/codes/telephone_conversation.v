

module telephone_conversation(clk,reset,BTN1,BTN2,BTN3,SW,
							  LED7,LED6,LED5,LED4,
							  digit1,digit2,digit3,digit4);

input clk,reset;
input BTN1,BTN2,BTN3;
input [1:0] SW;

output reg LED7,LED6,LED5,LED4;
output reg [6:0] digit1,digit2,digit3,digit4;

// timer connections
reg start_timer;
wire time_up;

// YOUR CODE STARTS HERE



// YOUR CODE ENDS HERE

// instantiate timer
timer my_timer(clk,reset,start_timer,time_up);

endmodule

module timer(clk,reset,start_timer,time_up);
// DO NOT MODIFY or DELETE THIS MODULE
// timer runs when start_timer is 1

input  clk,reset;
input  start_timer;
output reg time_up;

reg [31:0] counter;

always @(posedge clk or posedge reset) begin
	if(reset) begin
		counter <= 0;
		time_up <= 0;
	end
	else begin
		if(start_timer) begin
			if(counter < 32'd80)
				counter <= counter + 1;
			else 
				counter <= counter;
		end
		else begin
			counter <= 0;
		end
		
		time_up <= (counter == 32'd80);
	end
end

endmodule
