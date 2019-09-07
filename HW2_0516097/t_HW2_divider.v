module t_HW2_divider;

reg Clk, St;
reg [15:0] Divisor, Dividend;
wire  [15:0] Quotient;
wire Done,Overflow;

HW2_divider G1(Clk, St, Divisor, Dividend, Quotient, Overflow, Done);

initial #1200 $finish;

initial
 begin 
   Clk = 1'b0;
   forever #5 Clk = ~Clk;
end 



initial
fork 

 #1Dividend = 16'b1000101011101010;
 #1Divisor  = 16'b0000000010111011;
 #2 St=1;
 #12 St=0;

 #302 St=1;
 #302    Dividend =  16'b0001010101111111;
 #302    Divisor  =  16'b0001010101000110;
 #312 St=0;

 #602 St=1;
 #602    Dividend =  16'b0000010111000011;
 #602    Divisor  =  16'b1010010000100000;     
 #612 St=0;

 #902  St=1;
 #902    Dividend =  16'b1001001001001001;
 #902    Divisor  =  16'b0000000000000000;
 #912  St=0;
join 
endmodule 