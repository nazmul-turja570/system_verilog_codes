class driver;

    // Stimulus
    stimulus sti;

    // Scoreboard instance
    scoreboard scb;

    // Virtual Interface Instance
    virtual intf_cnt intf;

    // New Constructor
    function new(virtual intf_cnt intf, scoreboard scb);
        //$display("Inside Driver New function @ %0t", $time);
        this.intf = intf;
        this.scb  = scb;
    endfunction

    // Reset Task
    task reset();
        intf.reset = 1'b1;
        intf.data  = 1'b0;
        repeat(3) @(negedge intf.clock);
        intf.reset = 1'b0;
        repeat(2) @(negedge intf.clock);
        intf.reset = 1'b1;
        @(negedge intf.clock);
    endtask

    // Drive Task
    task drive();
        // Stimulus Creation
        sti = new();

        // Stimulus Generation
        if(sti.randomize()) begin
            if(sti.value == 1'b1)
                $display("Driver:: Sending One to DUT @ %0t", $time);
            else
                $display("Driver:: Sending Zero to DUT @ %0t", $time);
        end

        intf.data = sti.value;
        scb.expected_count = scb.expected_count + sti.value;
        @(negedge intf.clock);
    endtask

endclass
