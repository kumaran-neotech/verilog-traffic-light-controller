
`timescale 1ns/1ps

module tb_traffic_light;

    reg clk = 0;
    reg reset = 0;

    wire red, yellow, green;

    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock period = 10 ns
    always #5 clk = ~clk;

    task check_light;
        input expected_red;
        input expected_yellow;
        input expected_green;
        begin
            if ({red, yellow, green} !==
                {expected_red, expected_yellow, expected_green}) begin

                $display("FAIL at time %0t", $time);
                $display("Expected RYG=%b%b%b, Got RYG=%b%b%b",
                    expected_red, expected_yellow, expected_green,
                    red, yellow, green);

                $finish;
            end
            else begin
                $display("PASS at time %0t: RYG=%b%b%b",
                    $time, red, yellow, green);
            end
        end
    endtask

    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(0, tb_traffic_light);

        // Activate reset
        reset = 1;
        #2;
        check_light(1, 0, 0);

        // Release reset away from a clock edge
        #10;
        reset = 0;

        // RED -> GREEN
        repeat (5) @(posedge clk);
        #1;
        check_light(0, 0, 1);

        // GREEN -> YELLOW
        repeat (5) @(posedge clk);
        #1;
        check_light(0, 1, 0);

        // YELLOW -> RED
        repeat (5) @(posedge clk);
        #1;
        check_light(1, 0, 0);

        $display("All traffic-light checks passed!");
        $finish;
    end

endmodule
