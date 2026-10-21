
module traffic_light (
    input wire clk,
    input wire reset,
    output reg red,
    output reg yellow,
    output reg green
);

    reg [1:0] state;
    reg [3:0] timer;

    localparam RED    = 2'd0;
    localparam GREEN  = 2'd1;
    localparam YELLOW = 2'd2;

    // State transition and timer logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RED;
            timer <= 0;
        end
        else begin
            if (timer == 4) begin
                timer <= 0;

                case (state)
                    RED:     state <= GREEN;
                    GREEN:   state <= YELLOW;
                    YELLOW:  state <= RED;
                    default: state <= RED;
                endcase
            end
            else begin
                timer <= timer + 1'b1;
            end
        end
    end

    // Output logic
    always @(*) begin
        red = 0;
        yellow = 0;
        green = 0;

        case (state)
            RED:     red = 1;
            GREEN:   green = 1;
            YELLOW:  yellow = 1;
            default: red = 1;
        endcase
    end

endmodule
