module t_HW1_shift_register;

wire[7:0] Q;
reg [7:0] D;
reg  CLK, CLR,S0,S1,LSI,RSI;
wire [15:0] C;
reg [15:0] X;
reg L, R;

HW1_16bit_shift_register G2(C, X, CLK,CLR,L,R);
HW1_8bit_shift_register G1( Q, D, S0,S1,CLK,CLR,LSI, RSI );

initial 
  begin 
        CLK = 1;
	forever #10 CLK = ~CLK;
  end 
initial 
 begin 
      D = 8'b01011010;
      CLR=1;
  #15 CLR = 0;
  #20 CLR = 1; S0 = 1; S1 = 1;
  #20 S0 = 0; S1 = 0;
  #20 S0 = 0; S1=1; RSI = 1;
  #20 S0 = 0; S1=1; RSI =0;
  #20 S0 = 0; S1=0;
 #20 S0 = 1; S1=1; D = 8'b10100101;
 #20 S0 = 1; S1=0; LSI=1;
 #20 S0 = 1; S1=0; LSI=0;
 #20 CLR=0;
end 




initial 
    begin  
	X = 16'b0101010110101010;
	CLR = 1;
   #15  CLR = 0;
   #20  CLR = 1; L = 1; R = 1; 
   #20  L = 0; R = 0;
   #20  L = 0; R = 1;
   #20  L = 0; R = 1; 
   #20  L = 0; R = 0; 
   #20  L = 1; R = 1; X = 16'b1010101001010101;
   #20  L = 1; R = 0; 
   #20  L = 1; R = 0;  
   #20 CLR = 0;
   end 
  initial #200 $finish;
endmodule
