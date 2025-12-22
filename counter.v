module counter (
    input  wire        clk,
    input  wire        rst,   
    input  wire        E,       
    input  wire        D,       
    output reg [7:0]   count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 8'd0;           
        end
        else if (!E) begin
            count <= count;           // E = 0 no change
        end
        else if (!D) begin
            count <= count + 8'd1;    // E = 1, D = 0 up
        end
        else begin
            count <= count - 8'd1;    // E = 1, D = 1 down
        end
    end

endmodule
