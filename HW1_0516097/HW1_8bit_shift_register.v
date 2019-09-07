module HW1_8bit_shift_register( 
output  reg [7:0] Q, 
input reg [7:0]D,
input S0,S1,CLK,CLR,LSI, RSI
);
always @(posedge CLK,negedge CLR)
  if(CLR==0) Q<=8'b00000000;
    else 
     case ({S0,S1})
       2'b00:  Q <=Q;
       2'b01:  Q <={RSI,Q[7:1]};
       2'b10:  Q <={Q[6:0],LSI};
       2'b11:  Q <=D;
   endcase 
endmodule 