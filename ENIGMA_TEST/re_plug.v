module re_plug(I5, O5);
   
   input [4:0] I5;    //declare 5bit input
//   input clk;    //declare clock
   output [4:0] O5;   //declare 5bit output
   reg [4:0] O5;
//   integer index;

   always @*
   case(I5)   
      5'b00001: O5 = 5'b00010;   /*a to b*/ 
      5'b01101: O5 = 5'b01011;   /*m to k*/
      5'b11001: O5 = 5'b01100;   /*y to l*/
      5'b10101: O5 = 5'b00101;   /*u to e*/
      5'b10000: O5 = 5'b01111;   /*p to o*/
      5'b10010: O5 = 5'b10011;   /*r to s*/
      default: O5 = I5;
   endcase
endmodule
