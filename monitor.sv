class monitor;

    // Scoreboard Instance
    scoreboard scb;

    // Virtual Interface Instance
    virtual intf_cnt intf;

    // New Constructor
    function new(virtual intf_cnt intf, scoreboard scb);
        //$display("Inside Monitor New function @ %0t", $time);

        this.intf = intf;
        this.scb  = scb;

        fork
          capture();
        join_none
    endfunction

    task capture();
        forever begin
            //$display("Monitor is up and running!");
            @(negedge intf.clock);
            
            if(intf.data == 1'b1) begin
                scb.actual_count = intf.count;
                scb.check();
            end
        end
    endtask

endclass
