module HW1_add2_behavioral(output  reg S, V,input X, CLK,CLR);

reg [2:0] state, next_state;
parameter S0 = 3'b000, S1 = 3'b010, S2 = 3'b001, S3 = 3'b101, S4 =3'b011, S5 = 3'b111;

always @(posedge CLK, negedge CLR)
  if(CLR==0) state <= S0;
  else  state <= next_state;

always @ (state, X)
  case(state)
   S0: begin 
	if(X) 
		begin 
		  next_state <= S1;
		  S<=1; 
		  V<=0 ;
		end 
	else 
		begin 
		 next_state <=S1;
		  S<=0; 
		  V<=0;
		end 
	end 
   S1: begin 
	if(X) 
		begin 
		  next_state <= S4;
		  S<=0; 
		  V<=0 ;
		end 
	else 
		begin 
		 next_state <=S2;
		  S<=1; 
		  V<=0;
		end 
	end 

   S2: begin 
	if(X) 
		begin 
		  next_state <= S3;
		  S<=1; 
		  V<=0 ;
		end 
	else 
		begin 
		 next_state <=S3;
		  S<=0; 
		  V<=0;
		end 
	end 


   S3: begin 
	if(X) 
		begin 
		  next_state <= S0;
		  S<=1; 
		  V<=0 ;
		end 
	else 
		begin 
		 next_state <=S0;
		  S<=0; 
		  V<=0;
		end 
	end 


   S4: begin 
	if(X) 
		begin 
		  next_state <= S5;
		  S<=0; 
		  V<=0 ;
		end 
	else 
		begin 
		 next_state <=S3;
		  S<=1; 
		  V<=0;
		end 
	end 

   S5: begin 
	if(X) 
		begin 
		  next_state <= S0;
		  S<=0; 
		  V<=1 ;
		end 
	else 
		begin 
		 next_state <=S0;
		  S<=1; 
		  V<=0;
		end 
	end 

endcase 
endmodule 