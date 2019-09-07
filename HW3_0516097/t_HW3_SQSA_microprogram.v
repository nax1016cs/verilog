module t_HW3_SQSA_microprogram;

reg Clk, X1,X2,X3;
wire Z1,Z2,Z3;

HW3_SQSA_microprogram G1(Clk, X1, X2, X3, Z1, Z2, Z3 );


initial #90 $finish ;

initial 
  begin 
	#2  Clk<=0;
	forever  #10 Clk <=Clk+1;
		 
end 
initial 
  begin 
      {X1,X2,X3} = 3'b110; 
  #10 {X1,X2,X3} = 3'b011; 
  #10 {X1,X2,X3} = 3'b001; 
  #10 {X1,X2,X3} = 3'b101; 
  #10 {X1,X2,X3} = 3'b000; 
  #10 {X1,X2,X3} = 3'b000; 
  #10 {X1,X2,X3} = 3'b000; 
  #10 {X1,X2,X3} = 3'b100; 
  #10 {X1,X2,X3} = 3'b100;
  end 
endmodule 