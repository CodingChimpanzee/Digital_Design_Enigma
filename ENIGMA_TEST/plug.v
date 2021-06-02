module plug(I1, O1, clk);
   
   input [4:0] I1;    //declare 5bit input
   output [4:0] O1;   //declare 5bit output
   reg [4:0] O1;
   input clk;	

   always @(clk)
   case(I1)   
      5'd2: O1 <= 5'd1;      /*b to a 2-1*/ 
      5'd11: O1 <= 5'd13;    /*k to m 11-13*/
      5'd12: O1 <= 5'd25;    /*l to y 12-25*/
      5'd5: O1 <= 5'd21;     /*e to u 5-21*/
      5'd15: O1 <= 5'd16;    /*o to p 15-16*/
      5'd18: O1 <= 5'd19;    /*s to r 18-19*/
      
      5'd1: O1 <= 5'd2;      // a to b 1-2
      5'd13: O1 <= 5'd11;    // m to k 13-11    
      5'd25: O1 <= 5'd12;    // y to l 25-12
      5'd21: O1 <= 5'd5;     // u to e 21-5
      5'd16: O1 <= 5'd15;    // p to o 16-15
      5'd19: O1 <= 5'd18;    // r to s 19-18


   default: O1 <= I1;
   endcase
endmodule