module Enigma;                       // Encoding Scheme

   reg [4:0] I;  // initial value
   wire [4:0] O;  // final value
   wire [4:0] W1, W2, W3, W4;

   reg clk; // clock is for the Debugging
   
   plug P(I, W1, clk);
   rotor Ro(W1, W2, clk);
   reflector Re(W2, W3, clk); 
   re_rotor ReRo(W3, W4, clk);
   plug PRo(W4, O, clk);

        initial begin                    // Clock is for the Debugging

        clk = 0;   I = 5'd4;    #10;    // D
        clk = 1;   I = 5'd9;    #10;    // I
        clk = 0;   I = 5'd7;    #10;    // G
        clk = 1;   I = 5'd9;    #10;    // I
        clk = 0;   I = 5'd20;   #10;    // T      
        clk = 1;   I = 5'd1;    #10;    // A
        clk = 0;   I = 5'd12;   #10;    // L
 
        clk = 1;   I = 5'd4;    #10;    // D
        clk = 0;   I = 5'd5;    #10;    // E
        clk = 1;   I = 5'd19;   #10;    // S      
        clk = 0;   I = 5'd9;    #10;    // I
        clk = 1;   I = 5'd7;    #10;    // G
        clk = 0;   I = 5'd14;   #10;    // N

   $finish;
     
   end

endmodule
