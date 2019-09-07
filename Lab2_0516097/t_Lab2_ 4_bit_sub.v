module  t_Lab2_4_bit_sub;
  wire  [3:0] Diff;
  wire Bout;
  reg [3:0] X,Y;
  reg Bin;
 Lab2_ripple_borrow_4_bit_sub M1( Diff,  Bout,  X, Y,  Bin);
initial  
begin  
        X = 4'b1100; Y = 4'b0101; Bin = 1'b1;
#100    X = 4'b1101; Y = 4'b0110; Bin = 1'b0;
#100    X = 4'b0101; Y = 4'b1101; Bin = 1'b0;
#100    X = 4'b0110; Y = 4'b1101; Bin = 1'b1;
#100    X = 4'b1001; Y = 4'b1001; Bin = 1'b0;
#100    X = 4'b0101; Y = 4'b0101; Bin = 1'b1;
end 
initial #600 $finish;
endmodule 
