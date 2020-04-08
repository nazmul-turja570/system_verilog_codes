class scoreboard;

    bit [3:0] expected_count;
    bit [3:0] actual_count;

    function new();
        //$display("Inside Scoreboard New function @ %0t", $time);
    endfunction

    task check();
        
        if(expected_count == actual_count) begin
            $display("Scoreboard :: Actual count is %0d and Expected count is %0d @ %0t", actual_count, expected_count, $time);
        end
        else begin
            $display("Scoreboard :: ** ERROR ** Actual count is %0d, but Expected count is %0d @ %0t", actual_count, expected_count, $time);
        end
    endtask

endclass
