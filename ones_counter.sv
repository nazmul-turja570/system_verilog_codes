// *****************************
// ***** D Flip-Flop Module **** 
// *****************************

// ***************************
// *     ------------        *
// *  -->|din   dout|-->     *
// *     |          |        *
// *     |          |        *
// *     |          |        *
// *     |          |        *
// *     |          |        *
// *  -->|>clk ~dout|-->     *
// *     ------------        *
// ***************************
module dff( clock,
            reset,
            din,
            dout
          );

    // ------------------------
    // Input Output Declaration
    // ------------------------
    input   clock;
    input   reset;
    input   din;
    output  dout;

    // ---------------------
    // Internal Logics/Wires
    // ---------------------
    reg dout;

    always@(posedge clock, negedge reset) 
        if(!reset)
            dout <= 0;
        else
            dout <= din;

endmodule

// *******************************
// ***** One's Counter Module ****
// *******************************
module ones_counter( clk,
                     rst,
                     data,
                     count
                   );

    // ------------------------
    // Input Output Declaration
    // ------------------------
    input           clk;
    input           rst;
    input           data;
    output [3:0]    count;

    // ----------------------------------------------
    // D Flip-Flop Connection to Create One's Counter
    // ----------------------------------------------
    dff d0( .clock  (clk),
            .reset  (rst),
            .din    (count[0]^data),
            .dout   (count[0])
          );

    dff d1( .clock  (~count[0]),
            .reset  (rst),
            .din    (~count[1]),
            .dout   (count[1])
          );

    dff d2( .clock  (~count[1]),
            .reset  (rst),
            .din    (~count[2]),
            .dout   (count[2])
          );

    dff d3( .clock  (~count[2]),
            .reset  (rst),
            .din    (~count[3]),
            .dout   (count[3])
          );
endmodule
