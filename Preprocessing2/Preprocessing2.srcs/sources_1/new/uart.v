`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2016 01:30:01 PM
// Design Name: 
// Module Name: uart
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


module uart (
    clk,
    rst,
    tx,
    data,
    tx_en,
    tx_done
    //debugging
//    ,
//    state
    );
    
input clk;
input rst;
input data;
input tx_en;

output tx_done;
output tx;

//debugging
//output state;

reg[14:0] count;
reg[3:0] state;
reg muxbit;
reg[7:0] tx_data;

wire tx_done;
wire[7:0] data;
wire tick;

initial
begin
    count <= 0;
    state <= 0;
end

//baud rate generator:
parameter[14:0] baud_count = 15'd10416;     //Currently at 9600 baud, change to 867 for 115200 baud

always @(posedge clk)
begin
    count<=count+1;
    if(count == baud_count)
        count <= 0;           
end
assign tick = (count == baud_count);

//transmission
always @(posedge clk)
begin
    if(rst)
        state <= 4'b0000;
    else
    begin
    case(state)
    4'b0000: begin
                if(tx_en)
                    begin
                        state <= 4'b0100;
                        tx_data <= data;
                    end
             end
    4'b0100: begin if(tick) state <= 4'b1000; end // start
    4'b1000: if(tick) state <= 4'b1001; // bit 0
    4'b1001: if(tick) state <= 4'b1010; // bit 1
    4'b1010: if(tick) state <= 4'b1011; // bit 2
    4'b1011: if(tick) state <= 4'b1100; // bit 3
    4'b1100: if(tick) state <= 4'b1101; // bit 4
    4'b1101: if(tick) state <= 4'b1110; // bit 5
    4'b1110: if(tick) state <= 4'b1111; // bit 6
    4'b1111: if(tick) state <= 4'b0001; // bit 7
    4'b0001: if(tick) state <= 4'b0010; // stop1
    4'b0010: if(tx_en == 0)
                    begin
                        state <= 4'b0000; 
                    end
    default: state <= 4'b0000;
    endcase
    end
end

assign tx_done = (state == 4'b0010) ? 1'b1 : 1'b0;

always @(state[2:0])
case(state[2:0])
  0: muxbit <= tx_data[0];
  1: muxbit <= tx_data[1];
  2: muxbit <= tx_data[2];
  3: muxbit <= tx_data[3];
  4: muxbit <= tx_data[4];
  5: muxbit <= tx_data[5];
  6: muxbit <= tx_data[6];
  7: muxbit <= tx_data[7];
endcase

// combine start, data, and stop bits together
assign tx = (state<4) | (state[3] & muxbit); 

endmodule

