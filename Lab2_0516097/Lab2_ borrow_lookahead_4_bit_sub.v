module Lab2_borrow_lookahead_sub (output [3:0] Diff, output Bout, input [3:0] X, Y, input Bin);
wire B1,B2,B3,G1,G2,G3,G4,P1,P2,P3,P4;
assign P1 = X[0]^Y[0];
assign G1 = !X[0]&&Y[0];
assign Diff[0] = Bin^P1;
assign B1 = G1 ||!P1 && Bin ;
assign P2 = X[1]^Y[1];
assign G2 = !X[1] &&Y[1];
assign Diff[1] = B1^P2;
assign B2 = G2|| !P2 && B1; 
assign P3 = X[2]^Y[2];
assign G3 = !X[2] &&Y[2];
assign Diff[2] = B2^P3;
assign B3 = G3|| !P3 && B2;
assign P4 = X[3]^Y[3];
assign G4 = !X[3] &&Y[3];
assign Diff[3] = B3^P4;
assign Bout = G4|| !P4 && B3;  
endmodule 