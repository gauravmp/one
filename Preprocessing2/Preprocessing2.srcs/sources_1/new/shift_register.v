`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 06:32:00 PM
// Design Name: 
// Module Name: shift_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_register(
clk,                            //operates at 210MHZ with the phase shift
sync,                           //sync reset
shift_out,                      //signal from the controller to have the register parallel output the gathered data
sdo,                            //data signal from the ADC into the shift register
start_recording,                //signal from the controller to have the register start collecting data
data_out,                       //this is the 16 bit output data from the shift register
read_data,                      //signal from the shift register to have the time tagger read the output data
shift_reg_reset
//debugging
//,
//counter,
//cur_state
    );
    
input sdo;
input clk;
input sync;
input shift_out;
input start_recording;
input shift_reg_reset;

output data_out;
output read_data;

//debugging
//output counter, cur_state;

wire[15:0] data_out;

reg[15:0] data_reg;
reg[2:0] cur_state;
reg[2:0] next_state;
reg[4:0] counter;

parameter[2:0] idle = 3'd0;
parameter[2:0] pause = 3'd1;
parameter[2:0] capture = 3'd2;
parameter[2:0] hold = 3'd3;
parameter[2:0] done = 3'd4;

initial
begin
    data_reg <= 0;
    cur_state <= 0;
    next_state <= 0;
    counter <= 0;
end

//always @(posedge clk)
//begin
//    if(~shift_reg_reset)
//        begin
//            cur_state <= next_state;
//            if(cur_state == capture)
//                data_reg[15:0] <= {sdo,data_reg[15:1]};
//            else
//                data_reg[15:0] <= data_reg[15:0];
//        end
//    else
//        begin
//            cur_state <= idle;
//            data_reg[15:0] <= 16'd0;
//        end
//end

//always @(*)
//begin
//    case(cur_state)
//    idle:
//        begin
//            if(start_recording)
//                next_state = pause1;
//            else
//                next_state = idle;
//        end
//    pause1:
//        next_state = capture;
//    pause2:
//        next_state = capture;    
//    hold:
//        begin
//            if(counter == 15)
//                next_state = done;
//            else
//                next_state = capture;
//        end
//    capture:
//        begin
//            next_state = hold;
//            counter = counter + 1;
//        end
//    done:
//        begin
//            counter = 0;
//            next_state = idle;
//        end
//    default:
//        next_state = idle;
//    endcase
//end
always @(posedge clk)
begin
    if(~shift_reg_reset)
        begin
            if(cur_state == capture)
                data_reg[15:0] <= {sdo,data_reg[15:1]};
            else
                data_reg[15:0] <= data_reg[15:0];
        end
    else
        begin
            cur_state <= idle;
            data_reg[15:0] <= 16'd0;
        end
end

always @(posedge clk)
begin
    case(cur_state)
    idle:
        begin
            if(start_recording)
                begin
                    counter <= 0;
                    cur_state <= pause;
                end
            else
                cur_state = idle;
        end
    pause:
        cur_state <= capture;
    hold:
        begin
            if(counter == 5'd16)
                cur_state <= done;
            else
                cur_state <= capture;
        end
    capture:
        begin
            cur_state <= hold;
            counter <= counter + 5'd1;
        end
    done:
        begin
            counter <= 0;
            cur_state <= idle;
        end
    default:
        cur_state <= idle;
    endcase
end
//assign data_out = (shift_out)? data_reg : 0; 
//for debugging
assign data_out = data_reg;
    
endmodule
