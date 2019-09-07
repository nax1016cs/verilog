module HW2_multiplier (Clk, St, Mplier, Mcand, Product, Done);

input Clk, St;
input [7:0] Mplier, Mcand;
output  [15:0] Product;
output reg Done;

reg [2:0] count;
reg [1:0] state;
reg [8:0] A;
reg [8:0] B;

initial 
  begin 
    state <= 2'b0;
    A <= 9'b0;
    B <= 9'b0;
    count <= 3'b0;
  end 

assign Product = {A[7:0],B[8:1]};

always @(posedge Clk)
begin 
   case (state)
 0:
  begin 
   if(St==1)
          begin 
    A <= 9'b0;
    B[8:1] <= Mplier;
    B[0] <= 0;
    state<=1;
    Done <=0;
    count <=0;
   end
   else
    state<=0;
  end
      1: 
  begin 
   if(!(count==3'b111) && !(B[1]) && !(B[0]) || !(count==3'b111) && B[1] && B[0] )  //sh
    begin 
     A <={A[8], A[8:1]};
     B <={A[0], B[8:1]};
     count <= (count+1);
     state <= 1;
    end
   else if (!(B[1]) && B[0])
    begin
     A <= A + {Mcand[7], Mcand};
     state <= 2;
    end 
   else if (B[1] && !(B[0]) )
    begin 
     A <= A + {~Mcand[7], ~Mcand} +1 ;
     state <= 3;
    end 
   else if ((count==3'b111) && !(B[1]) && !(B[0]) || (count==3'b111) && B[1] && B[0] )
    begin 
     A <={A[8], A[8:1]};
     B <={A[0], B[8:1]};
     state <=0;
     Done <=1;
    end 
  end
 2,3:
  begin 
   if(count==3'b111)
    begin 
     A <={A[8], A[8:1]};
     B <={A[0], B[8:1]};
     state <=0;
     Done <=1;
     count <=0;
    end 
   else 
    begin 
     A <={A[8], A[8:1]};
     B <={A[0], B[8:1]};
     count <= (count+1);
     state <=1;
    end

  end 
 endcase 
end 
endmodule
