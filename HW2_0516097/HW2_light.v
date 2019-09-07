module HW2_light(Clk, Left, Right, Haz, La, Lb, Lc, Ra, Rb, Rc);

input Clk, Left, Right,Haz;
output La, Lb,Lc,Ra,Rb,Rc;

reg tLa,tLb,tLc,tRa,tRb,tRc;

assign La = tLa;
assign Lb = tLb;
assign Lc = tLc;
assign Ra = tRa;
assign Rb = tRb;
assign Rc = tRc;

reg [2:0] state;

initial 
  begin 
    tLa=0; 
    tLb=0;
    tLc=0;
    tRa=0;
    tRb=0; 
    tRc=0;
    state<=3'b0;
  end 


always @(posedge Clk)
  begin 
    case (state)
	0: 
          begin 
		tLc<=0;
		tLb<=0;
		tLa<=0;
		tRa<=0;
		tRb<=0;
		tRc<=0;
	   if(!(Left) && !(Right) && !(Haz))
		state<=0;
	  else if (Left && !(Right) && !(Haz))
		state<=1;	  else if (!(Left) && Right && !(Haz))
		state<=4;
	  else 
		state<=7;	
	  end 
	1:
	  begin 
		tLc<=0;
		tLb<=0;
		tLa<=1;
		tRa<=0;
		tRb<=0;
		tRc<=0;
	   if(Left && !(Haz))
		state<=2;
	   else if (!(Left) && !(Haz))
		state <=0;
	   else if (Haz)
		state<=7;
	  end 
        2:
	  begin 
		tLc<=0;
		tLb<=1;
		tLa<=1;
		tRa<=0;
		tRb<=0;
		tRc<=0;
	 if(Left && !(Haz))
		state<=3;
	else if (!(Left) && !(Haz))
		state<=0;
	else if (Haz)
		state<=7;
	  end 
	3:
	  begin 
		tLc<=1;
		tLb<=1;
		tLa<=1;
		tRa<=0;
		tRb<=0;
		tRc<=0;
	  if (!(Haz))
		state<=0;
	  else 
		state<=7;
	  end 
	4:
	  begin 
		tLc<=0;
		tLb<=0;
		tLa<=0;
		tRa<=1;
		tRb<=0;
		tRc<=0;	  
	if(!(Right) && !(Haz))
		state<=0;
	else if (Right && !(Haz))
		state<=5;
	else 
		state<=7;
	end
	5:
	  begin 
		tLc<=0;
		tLb<=0;
		tLa<=0;
		tRa<=1;
		tRb<=1;
		tRc<=0;	
	  if(!(Right) && !(Haz))
		state<=0;
	  else if(Right && !(Haz))
		state<=6;
	  else 
		state<=7;
	  end 
	6:
	  begin 
		tLc<=0;
		tLb<=0;
		tLa<=0;
		tRa<=1;
		tRb<=1;
		tRc<=1;
	  if(!(Haz))
		state<=0;
	  else 
		state<=7;
	  end 
	 7: 
	  begin 
		tLc<=1;
		tLb<=1;
		tLa<=1;
		tRa<=1;
		tRb<=1;
		tRc<=1;
		state<=0;
	  end 
	endcase	
  end 
endmodule 
