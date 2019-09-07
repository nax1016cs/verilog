module HW3_SQSA_microprogram (input Clk, X1, X2, X3, output reg Z1, Z2, Z3 );


reg [2:0] state, next_state;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 =3'b100, S5 = 3'b101 , S6 = 3'b110 , S7 = 3'b111;

initial 
  begin 
	{Z1,Z2,Z3} = 3'b000; 
	state = 3'b000;
  end
always @ (Clk)
  state <= next_state;

always @ (state, X1,X2,X3)
  case (state)
  S0:
     begin 
	{Z1,Z2,Z3} = 3'b001; 
	if(X1)
		next_state <= S4;
	else
		next_state <=state+1;
     end 
  S1:
     begin 
	{Z1,Z2,Z3} = 3'b000; 
	if(X3)
		next_state <= S7;
	else
		next_state <=state+1;
     end 
   S2:
     begin 
	{Z1,Z2,Z3} = 3'b000; 
	if(X2)
		next_state <= S0;
	else
		next_state <=state+1;
     end 
  
  S3:
     begin 
	{Z1,Z2,Z3} = 3'b000; 
	next_state <= S0;
     end 
  
  S4:
     begin 
	{Z1,Z2,Z3} = 3'b000; 
	if(X2)
		next_state <= S6;
	else
		next_state <=state+1;
     end 
  
  S5:
     begin 
	{Z1,Z2,Z3} = 3'b000; 
	next_state <= S3;
     end 
  
  S6:
     begin 
	{Z1,Z2,Z3} = 3'b100; 
	next_state <= S2;
     end 
  
  S7:
     begin 
	{Z1,Z2,Z3} = 3'b010; 
	next_state <= S3;
     end 
endcase 
endmodule 
  
