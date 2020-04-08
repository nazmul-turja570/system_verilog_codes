program testcase(intf_cnt intf);

    // Environment
    environment env = new(intf);


    initial begin
        env.agnt.drvr.reset();
        $display("#######################################################");
        repeat(20) env.agnt.drvr.drive();  
        $display("#######################################################");    
        $finish();
    end 

endprogram 
