// AstroTinker Bot : Task 1C : Pulse Generator and Detector
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to design a module which will generate a 10us pulse and detect incoming pulse signal.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

// t1c_pulse_gen_detect
//Inputs : clk_50M, reset, echo_rx
//Output : trigger, distance, pulses, state

// module declaration
module t1c_pulse_gen_detect (
    input clk_50M, reset, echo_rx,
    output reg trigger, out,
    output reg [21:0] pulses,
    output reg [1:0] state
);

initial begin
    trigger = 0; out = 0; pulses = 0; state = 0;
end

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////
parameter STATE_A = 2'b00, STATE_B = 2'b01, STATE_C = 2'b10, STATE_D =2'b11;

reg[16:0] counter= 17'd0;
reg[16:0] width = 0;

always @(posedge clk_50M or posedge reset) begin 
	if (reset) begin
		state = STATE_A;
		trigger = 0;
		out = 0 ;
		pulses=0;
		counter = 17'b0;
		width=0;
	end else begin
		case (state)
			STATE_A:begin
		
				counter=counter+1'b1;
				if (counter==17'd50) begin
					state = STATE_B;
					counter = 17'b0;
				end	
         end
	      STATE_B:begin
				trigger =1;
				counter = counter+1'b1;
				if(counter==17'd501)begin
					state =STATE_C;
					trigger=0;
					counter =17'b0;
			   end
			end
			STATE_C:begin
				counter = counter+1'b1;
				if(echo_rx) begin
					width <= width+1'b1;
				end
				
				if(counter==17'd49999)begin
					state=STATE_D;
					counter=17'b0;
				end
					
			end
			STATE_D:begin
				if (width == 17'd29409)begin
					out= 1;
					state=STATE_A;
					width =0;
				end else begin
					state=STATE_A;
					
				end
			end
		
			
	 endcase
	 
 end
//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////
 end
endmodule
