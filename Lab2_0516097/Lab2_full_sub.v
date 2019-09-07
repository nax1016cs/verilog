module Lab2_full_sub(output D, B, input x, y, z);
wire S1,S2,S3;
Lab2_half_sub_gate_level HS1( S1,S2, x,y);
Lab2_half_sub_gate_level HS2( D,S3,  S1,z);
or G1(B,S3,S2);
endmodule 

