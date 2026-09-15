`timescale 1ns / 1ps

module rgb_led_top #(parameter int CLK_CYCLE_PER_TOGGLE = 62_500_000)
    (
        input logic sysclk,
        input logic rst,
        input logic [2:0] sw,
        
        output logic [2:0] rgb_out
    );
    
    // Internal wires connecting blinking_led module to this top module:
    logic led_en;
    logic led_out;
    
    // Instantiations:
    blinking_led #(.CLK_CYCLE_PER_TOGGLE(CLK_CYCLE_PER_TOGGLE)) blinkLED
        (
            .sysclk(sysclk),
            .rst(rst),
            .led_en(led_en),
            .led_out(led_out)
        );
    
    // Procedural Logic to blink RGB light:
    always_comb
        begin
            if (sw == 3'b001)
                begin
                    led_en = 1;
                    rgb_out[0] = led_out;
                    rgb_out[1] = 0;
                    rgb_out[2] = 0;
                end
            
            else if (sw == 3'b010)
                begin
                    led_en = 1;
                    rgb_out[0] = 0;
                    rgb_out[1] = led_out;
                    rgb_out[2] = 0;
                end
            
            else if (sw == 3'b100)
                begin
                    led_en = 1;
                    rgb_out[0] = 0;
                    rgb_out[1] = 0;
                    rgb_out[2] = led_out;
                end
                
            else
                begin
                    led_en = 0;
                    rgb_out[2:0] = 0;
                end
        end
                
endmodule
