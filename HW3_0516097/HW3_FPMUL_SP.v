module HW3_FPMUL_SP( Clk, St, FPmplier, FPmcand, Done, Ovf, Unf, FPproduct);

input Clk, St;
input [31:0] FPmplier, FPmcand;
output reg Done, Ovf, Unf;
output reg  [31:0] FPproduct;

reg Load;
reg s1, s2;
reg [7:0] e1,e2;
reg [22:0] f1,f2;
reg [2:0] state, next_state;
reg [47:0] tf;//temp_fraction
reg [8:0]  te;//temp_exponent
reg temp;
reg z;

initial 
  begin 
	temp = 1;
	Load = 0;
	s1 = 0;
	s2 = 0;
	e1 = 0;
	e2 = 0;
	f1 = 0;
	f2 = 0;
	state = 0;
	next_state = 0;
	Done = 0;
	Ovf = 0;
	Unf = 0;
	FPproduct = 0;
	te = 0;
	tf = 0;
	z = 0;
  end 

always @ (posedge Clk)
  begin 
	state <= next_state;
  end 

always @( state,St)

  case (state)
	0: 	
	  begin
		Done <= 0;
		Ovf <= 0;
		Unf <= 0;
		FPproduct <= 0;
		if(St==1)
		  begin 
			Load <=1;
			next_state <=1;
		  end 
		else 
			next_state <=0;
	  end 
	1: 
	  begin 
		s1 = FPmplier[31];
		s2 = FPmcand[31];
		e1 = FPmplier[30:23];
		e2 = FPmcand[30:23];
		f1 = FPmplier[22:0];
		f2 = FPmcand [22:0];
		te = e1  + e2 -127 ;
		tf = {temp,f1} * {temp,f2};
		next_state = 2;
	  end 

	2:
	  begin 
		if(tf[47]==1)
		  begin 
		    FPproduct[31] = s1^s2;
		    te <= te+1;
		    FPproduct[30:23] <=te+1;
		    FPproduct[22:0] <= tf[46:24];
		    next_state <=3;
		  end 
		else 
		  begin 
		    FPproduct[31] = s1^s2;
		    FPproduct[30:23] <=te;
		    FPproduct[22:0]  <= tf[45:23];
		    next_state <=3;
		  end 
		
	  end

	3:
	  begin 
		Done <=1;
		if(e1+e2>381)
			next_state <=4;
		else if(e1+e2<128)
		  begin
			next_state <= 5;
		  end 
		else 
		  begin 
			if(St==1)
			  next_state <=3;
			else 
		 	 next_state <=0;
		  end 

	  end 
	4:
	  begin 
		Ovf<=1;
		if(St==1)
		  next_state <=3;
		else 
		  next_state <=0;
	  end 

	5: 
	  begin 
		Unf <=1;
 		if(St==1)
		  next_state <=3;
		else 
		  next_state <=0;
	  end 
  endcase 
endmodule 