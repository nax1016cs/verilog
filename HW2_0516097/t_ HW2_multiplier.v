module t_HW2_multiplier;

wire [15:0] Product;
wire Done;
reg Clk, St;
reg [7:0] Mplier, Mcand;

 HW2_multiplier  G1(Clk, St, Mplier, Mcand, Product, Done);

initial #400 $finish;

initial
 begin 
   Clk = 1'b0;
   forever #5 Clk = ~Clk;
end 

initial
fork 
 Mplier = 8'b01100110;
 Mcand  = 8'b10100110;
 #2 St=1;
 #12 St=0;
 #138 St=1;
 #138 Mplier =  8'b00110011;
 #138 Mcand  = 8'b01100110;
 #148 St=0;
join 
endmodule 
