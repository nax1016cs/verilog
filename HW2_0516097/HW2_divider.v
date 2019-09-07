module HW2_divider(Clk, St, Divisor, Dividend, Quotient, Overflow, Done);

input Clk, St;
input [15:0] Divisor, Dividend;
output  [15:0] Quotient;
output reg Done,Overflow;

wire B;
wire K;reg [3:0]count;
reg [1:0]state;
reg [15:0] Acc;
reg [15:0] D;

assign B = (Acc < Divisor) ? 1: 0 ;
assign K = (count==4'b1111) ? 1: 0 ;
assign Quotient = D;

initial 
  begin 
    state <= 2'b0;
    D <= 16'b0;
    Acc  <=16'b0;
    count <= 4'b0;
    Overflow <=0;
  end 

  always @(posedge Clk)
     begin 
      case (state)
	  0:
            if(St==1)
		begin 
			 Done <=0;
			 count <=4'b0;
			 Overflow <=0;
			 state <=1; //load Divisor	
		end		
	    else 
		state <=0;
           1:
		if(Divisor==16'b0)
		  begin 
		   state <= 0;
		   Overflow <=1;
		  end 
		else 
		   begin 
			Acc <=16'b0;
			D <=Dividend;
			state <=2;
		   end  
	   2:
		begin
			Acc <= {Acc[14:0], D[15]};
			D <= {D[14:0], Acc[15]};
			state <=3;
		end 
	   3: 
		begin 
		  if(B && !(K))
			begin 
				Acc <= {Acc[14:0], D[15]};
				D <= {D[14:0], 1'b0};
				count <= count +1;
				state<=3;
			end 
		   else if(!(B) && !(K))
			begin 
				Acc <= Acc - Divisor;
				D [0] <=1;
				state<=3;
			end 

 		  else if(!(B) && K)
			begin 
				Acc <= Acc - Divisor;
				D [0] <=1;				
				Done <= 1;
				state<=0;
			end 
		else if (  B && K)
			begin 
				Done <=1;
				state <=0;
			end 
		end 
	endcase
    end
endmodule 

