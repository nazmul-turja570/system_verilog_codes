class agent;

    // Driver
    driver drvr;

    // Monitor    
    monitor mntr;

    // Virtual Interface Instance
    virtual intf_cnt intf;

    // New Constructor
    function new(virtual intf_cnt intf, scoreboard scb);
        //$display("Inside Agent New function @ %0t", $time);
        this.intf = intf;
        drvr = new(intf, scb);
        mntr = new(intf, scb);
    endfunction

endclass
