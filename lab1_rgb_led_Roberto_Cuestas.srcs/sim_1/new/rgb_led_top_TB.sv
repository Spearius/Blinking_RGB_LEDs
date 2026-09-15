`timescale 1ns / 1ps

module rgb_led_top_TB ();

// Internal Signals:
    logic sysclk;
    logic rst;
    logic [2:0] sw;
    logic [2:0] rgb_out;

// Instantiatiation:
    rgb_led_top #(.CLK_CYCLE_PER_TOGGLE (1)) DUT
        (
            .sysclk(sysclk),
            .rst(rst),
            .sw(sw),
            .rgb_out(rgb_out)
        );
        
    // Clock Signal Toggle Time:
    always
        begin
            #5 sysclk = ~sysclk;
        end
    
    // Test Cases:
    initial
        begin
            sysclk = 0;
            rst = 1;
            sw = 3'b000;
            #10;
            
            // Test Case 1: All Switches Off
            rst = 0;
            sw = 3'b000;
            #20;
            
            // Test Case 2: Rightmost switch ON, then with RESET pressed
            rst = 0;
            sw = 3'b001;
            #20;
            
            rst = 1;
            sw = 3'b001;
            #10;
            
            // Test Case 3: Second switch ON, then with RESET pressed
            rst = 0;
            sw = 3'b010;
            #20;
            
            rst = 1;
            sw = 3'b010;
            #10;
            
            // Test Case 4: Leftmost switch ON, then with RESET pressed
            rst = 0;
            sw = 3'b100;
            #20;
            
            rst = 1;
            sw = 3'b100;
            #10;
            
            // Test Case 5: All switches ON, then with reset pressed
            rst = 0;
            sw = 3'b111;
            #20;
            
            rst = 1;
            sw = 3'b111;
            #10;
            
            $finish;
        end            
            
endmodule
