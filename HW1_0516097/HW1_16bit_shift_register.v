module HW1_16bit_shift_register(

output [15:0] Q,            
input [15:0] X,
input CLK,CLR,L,R);

HW1_8bit_shift_register G1(Q[15:8], X[15:8],L,R,CLK,CLR, Q[7],Q[0]);
HW1_8bit_shift_register G2(Q[7:0], X[7:0], L, R,CLK,CLR, Q[15],Q[8]);
endmodule 