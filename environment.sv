class environment;

    // Agent
    agent agnt;
    
    // Scoreboard Instance
    scoreboard scb;

    // Virtual Interface Instance
    virtual intf_cnt intf;

    // New Constructor
    function new(virtual intf_cnt intf);
        //$display("Inside Environment New function @ %0t", $time);
        this.intf = intf;
        scb  = new();
        agnt = new(intf, scb);
    endfunction

endclass
