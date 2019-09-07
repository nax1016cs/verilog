module t_HW3_FPMUL_SP;

reg Clk,St;
reg [31:0] FPmplier, FPmcand;
wire Done, Ovf,Unf;
wire [31:0] FPproduct;

HW3_FPMUL_SP G1( Clk, St, FPmplier, FPmcand, Done, Ovf, Unf, FPproduct);


initial 
  begin 
	Clk=0;
	forever  #10 Clk =~Clk; 
end 


initial 
  fork
    #8  St =1;
    #10 FPmplier = 32'b00111001110101010101010101010101; 
    #10	FPmcand = 32'b11010101000110011001100110011001;
    #88 St = 0;
    #98 St = 1;
    #100 FPmplier = 32'b11000111110110011001100110011001;
    #100 FPmcand = 32'b11111100101101000000000000000000;
    #188 St = 0;
    #198 St = 1; 
    #200 FPmplier = 32'b00000001110111111111111111111101;
    #200 FPmcand = 32'b10100101001000000000000000000010;
    #300 $finish ;


  join 
 endmodule 