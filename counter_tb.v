`timescale 1ns/1ps

module counter_tb;

    reg         clk;
    reg         rst;
    reg         E;
    reg         D;
    wire [7:0]  count;

    counter dut (
        .clk   (clk),
        .rst   (rst),
        .E     (E),
        .D     (D),
        .count (count)
    );


    always #5 clk = ~clk;   


    initial begin
        clk = 0;
        rst = 0;
        E   = 0;
        D   = 0;

        // ----------------------
        // Test 1:
        // ----------------------
        #3;
        rst = 1;            
        #7;
        rst = 0;            

        // ----------------------
        // Test 2: E = 0, D = X → no change
        // ----------------------
        E = 0;
        D = 0;
        #40;

        D = 1;              // 
        #40;

        // ----------------------
        // Test 3: E = 1, D = 0 → count up
        // ----------------------
        E = 1;
        D = 0;
        #80;

        // ----------------------
        // Test 4: E = 1, D = 1 → count down
        // ----------------------
        D = 1;
        #80;

        // ----------------------
        // Test 5: Reset khi đang đếm
        // ----------------------
        rst = 1;            
        #10;
        rst = 0;

        // ----------------------
        // Test 6: Wrap-around check
        // ----------------------
        E = 1;
        D = 1;              // count down từ 0 → 255
        #20;

        // ----------------------
        // Finish simulation
        // ----------------------
        #50;
        $finish;
    end

    // ======================
    // Monitor
    // ======================
always @(count) begin
    $display("Time=%0t | count changed -> %0d", $time, count);
end



endmodule
