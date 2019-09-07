module HW1_add2_dataflow(output  S,V,input X,CLK,CLR);

reg D1,D2,D3;

always @ (posedge CLK, negedge CLR)
if (CLR==0)
  begin
    D1 <= 0;
    D2 <= 0;
    D3 <= 0; 
  end 
else
  begin 
 	D1 <= (~D1) & D3;
 	D2 <= ((~D2) & (~D3) ) | (X & (~D1) & D2);
 	D3 <= ((~D1) & D3 ) | (D2 & (~D3));
  end 

    assign S =  (X & (~D2)) | ((~X) & D2);
    assign V = X & D1 & D2;

endmodule 

