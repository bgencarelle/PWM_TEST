
//`#start header` -- edit after this line, do not edit this line
// ========================================
//
// Copyright YOUR COMPANY, THE YEAR
// All Rights Reserved
// UNPUBLISHED, LICENSED SOFTWARE.
//
// CONFIDENTIAL AND PROPRIETARY INFORMATION
// WHICH IS THE PROPERTY OF your company.
//
// ========================================
`include "cypress.v"
//`#end` -- edit above this line, do not edit this line
// Generated on 04/11/2017 at 22:43
// Component: cheap_pwm
module cheap_pwm (
	output  reg pwm_out,
	input   bit_input,
	input   clk,
	input  [3:0] compare,
	input   enable,
	input  [3:0] period
);

//`#start body` -- edit after this line, do not edit this line

    reg   [4:0] period_counter;
    reg   [6:0] up_time;
    reg   [6:0] down_time;
    reg   [7:0] all_time;
       always@(posedge clk) 
       begin
            if(enable == 1'b0 | compare == 4'b0)
                period_counter <= 4'b0;
            else
                period_counter <= period_counter + 1'b1;
        end
         always@(posedge clk)        
         begin
            if(bit_input ==1'b1)
            up_time <= up_time + 1'b1;
            else
            down_time <= down_time + 1'b1;
        all_time = (up_time + down_time);
        end
            
        wire pwm;        
        assign pwm = (period_counter >= compare) ? 1'b1 :(period == 4'b0 ) ? bit_input 
            :((compare >= period_counter)) ? 1'b0 : 1'b1;
// synchronuous pwm output to ...
        always@(posedge clk)
            pwm_out <= pwm;
//        Your code goes here

//`#end` -- edit above this line, do not edit this line
endmodule
//`#start footer` -- edit after this line, do not edit this line
//`#end` -- edit above this line, do not edit this line
