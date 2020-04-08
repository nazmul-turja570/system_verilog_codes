module top();

    // Clock Generator
    reg clock = 1'b0;
    initial forever #5 clock = ~clock;

    // Interface
    intf_cnt intf(clock);

    // DUT
    ones_counter DUT(.clk(intf.clock),
                     .rst(intf.reset),
                     .data(intf.data),
                     .count(intf.count)
                    );

    // Testcase
    testcase test(intf);

endmodule
