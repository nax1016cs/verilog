module D_ff (output reg Q,output NQ,input  D, Clk, rst);

assign NQ = ~Q;

always@ (posedge Clk, negedge rst)
if (rst==0) 
Q <= 1'b0; 
else 
 Q <= D;
endmodule
