// AstroTinker Bot : Task 2A : UART Receiver
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to receive UART Rx data packet from receiver line and then update the rx_msg and rx_complete data lines.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

/*
Module UART Receiver

Input:  clk_50M - 50 MHz clock
        rx      - UART Receiver

Output: rx_msg      - read incoming message
        rx_complete - message received flag
*/

// module declaration
module uart_rx (
  input clk_50M, rx,
  output reg [7:0] rx_msg,
  output reg rx_complete
);

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

////////////////////////// Add your code here


initial begin

rx_msg = 0; rx_complete = 0;

end

parameter IDLE =3'd0, ST1=3'd1,ST2=3'd2,ST3=3'd3,ST4=3'd4;


reg[9:0] counter=10'd216;
reg[2:0] state =IDLE;
reg baud_tick;
reg[10:0] register=0;
reg[3:0] bit_counter=0;
reg[10:0] count=1'b0;
reg[1:0] a=0;



/*always @(posedge clk_50M ) begin
  if (counter == 10'd433) begin
      counter <= 0;
    baud_tick <= 1;
  end else begin
    counter <= counter + 1;
    baud_tick <= 0;
  end
end*/

always @(posedge clk_50M) begin
	case(state)
		IDLE:begin
		  register<=0;
		  rx_complete<=1'b0;
		  counter=counter+1'b1;
		  if(counter==10'd433)begin
			  if(rx==0)begin
				state=ST1;
				counter=1'b0;
		     end 
			end  
		end
      ST1:begin
			if(counter==10'd434)begin
				register={register[9:0],rx};
				bit_counter=bit_counter+1;
				counter=1'b0;
			
			end else if(bit_counter==8)begin
				state=ST2;
				bit_counter=1'b0;
			end	
		end
		ST2:begin
		   counter=counter+1'b1;
			if(counter==10'd434)begin
				if(rx)begin
					state = ST3;
					counter=1'b0;
				end
			end
		end
		ST3:begin
			count<=count+1'b1;
			if(count==10'd214)begin
				state=ST4;
				count<=1'b0;
			end
		end
		ST4:begin
			rx_complete<=1'b1;
			rx_msg<=register;
			state=IDLE;
		end
	endcase
end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule