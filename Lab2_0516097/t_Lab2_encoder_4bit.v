module t_Lab2_encoder_4bit;
  wire [1:0] Aout;
  wire V;
  reg [3:0] D;
Lab2_encoder_4bit_gate_level M1(  Aout,  V,   D);
Lab2_encoder_4bit_dataflow   M2(  Aout,  V,   D);
Lab2_encoder_4bit_behavior   M3(  Aout,  V,   D);
initial 
 begin 
	D[0] = 1'b0; D[1] = 1'b0; D[2] = 1'b0; D[3] = 1'b0;
#100    D[0] = 1'b0; D[1] = 1'b0; D[2] = 1'b0; D[3] = 1'b1;
#100    D[0] = 1'b0; D[1] = 1'b0; D[2] = 1'b1; D[3] = 1'b0;
#100    D[0] = 1'b0; D[1] = 1'b0; D[2] = 1'b1; D[3] = 1'b1;
#100    D[0] = 1'b0; D[1] = 1'b1; D[2] = 1'b0; D[3] = 1'b0;
#100    D[0] = 1'b0; D[1] = 1'b1; D[2] = 1'b0; D[3] = 1'b1;
#100    D[0] = 1'b0; D[1] = 1'b1; D[2] = 1'b1; D[3] = 1'b0;
#100    D[0] = 1'b0; D[1] = 1'b1; D[2] = 1'b1; D[3] = 1'b1;
#100    D[0] = 1'b1; D[1] = 1'b0; D[2] = 1'b0; D[3] = 1'b0;
#100    D[0] = 1'b1; D[1] = 1'b0; D[2] = 1'b0; D[3] = 1'b1;
#100    D[0] = 1'b1; D[1] = 1'b0; D[2] = 1'b1; D[3] = 1'b0;
#100    D[0] = 1'b1; D[1] = 1'b0; D[2] = 1'b1; D[3] = 1'b1;
#100    D[0] = 1'b1; D[1] = 1'b1; D[2] = 1'b0; D[3] = 1'b0;
#100    D[0] = 1'b1; D[1] = 1'b1; D[2] = 1'b0; D[3] = 1'b1;
#100    D[0] = 1'b1; D[1] = 1'b1; D[2] = 1'b1; D[3] = 1'b0;
#100    D[0] = 1'b1; D[1] = 1'b1; D[2] = 1'b1; D[3] = 1'b1;
 end
initial #1600 $finish;
endmodule 