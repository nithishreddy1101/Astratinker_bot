// AstroTinker Bot : Task 2A : UART Transmitter
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to generate UART Tx data packet to transmit the messages based on the input data.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

/*
Module UART Transmitter

Input:  clk_50M - 50 MHz clock
        data    - 8-bit data line to transmit
Output: tx      - UART Transmission Line
*/

// module declaration
module uart_tx(
    input  clk_50M,
    input  [7:0] data,
    output reg tx
);

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

initial begin
	 tx = 0;
end

reg [1:0] state =2'b00;
reg [9:0] counter;
reg [10:0] register=1'b1;
reg [9:0] bit_counter = 1'b1;
reg baud_tick;



/*always @(posedge clk_50M) begin
  if (counter == 10'd433) begin
      counter <= 0;
    baud_tick <= 1;
	 
  end else begin
    counter <= counter + 1'b1;
    baud_tick <= 0;
  end
end*/



always @(posedge clk_50M) begin
	case (state)
        2'b00: begin
          if (data!=0) begin
            state = 2'b01; 
				counter<=1'b0;
          end
			end
		  2'b01: begin
		    counter<=counter+1'b1;
            if(counter==10'd433) begin
					tx = 1'b0; 
					state=2'b10;
					counter<=1'b0;
				end
		  end
		  2'b10:begin
		   counter<=counter+1'b1;
			  
		  	if(bit_counter==8)begin
			   state<=2'b11;
				bit_counter=1'b0;
			end
			if (counter==10'd433) begin
					tx = data[bit_counter];
					bit_counter= bit_counter + 1'b1;
					counter<=1'b0;
			end
		  end
		  2'b11:begin
		    counter=counter+1'b1;
		    if(counter==10'd433)begin
		       tx<=1'b1;
		       state=2'b00;
			 end   
        end
   endcase
end


//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule