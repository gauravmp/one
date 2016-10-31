`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2016 10:40:14 PM
// Design Name: 
// Module Name: pulse_generator
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

//-----------------------------------//
//Notes
//-----------------------------------//
module pulse_generator(
clk,                    //100MHz clock
clk105,                 //105MHz clock for SCK
clk210,                 //210MHz clock for cnv pulse
sck,
clk10,                  //10MHz clock to generate the syn signals
reset,
locked,
cnv,
sync,
time_tag,
shift_out,
start_recording,
shift_reg_reset

//debugging
,
counter,
sck_gate,
sync_gate,
syn
    );
    
input clk, clk10, clk105, clk210;
input reset;
input locked;
    
output sync;
output cnv,sck;
output time_tag;
output shift_out, start_recording;   
output shift_reg_reset;
    
//debugging
output sync_gate,counter, sck_gate,syn;

wire sync;
reg syn = 0;

//-------------------------------//
//generating the sync clock
wire sync_gate;
assign sync_gate = clk & clk105;
always @(posedge clk10)
begin
//    syn <= ~syn;
    if(~clk105)
        syn <= 0;
    else
        syn <= 1;
end

reg d1 = 0;

always @(posedge clk)
begin
    d1 <= syn;
end

assign sync = syn&(~d1);         //This provides a pulse for one clock (105MHz) cycle every 0.2us

//-------------------------------//

//counter
reg[5:0] counter = 0;
reg rise = 0;
always @(posedge clk105, posedge sync)
begin
    if(sync)
        counter <= 0;
    else
        counter <= counter + 1;
end
//-------------------------------//
//parameter list for various events
parameter sck_start = 6'd2;  
parameter sck_end = 6'd18;

//-------------------------------//

//CNV pulse
reg cnv1=0, cnv2=0, cnv3=0, cnv4=0, cnv5=0, cnv6=0;
always @(posedge clk210)                //change this clock here to 210 MHz to avoid an issue seen in simulation
begin
    {cnv6,cnv5,cnv4,cnv3,cnv2,cnv1} <= {cnv5,cnv4,cnv3,cnv2,cnv1,syn};     
end
assign cnv = syn&(~cnv6);

//SCK gate
reg sck_gate = 0;
always @(posedge clk105)
begin
    if(locked)
        begin
            if(counter == sck_start)
                sck_gate <= 1;
            else if(counter == sck_end)
                sck_gate <= 0;
            else
                sck_gate <= sck_gate;
        end
    else
        sck_gate <= sck_gate;
end
assign sck = ~((clk105)&(sck_gate));

//-------------------------------//
//other pulses to the shift register

//start_recording pulse
reg d2 = 0;

always @(posedge clk)
begin
    d2 <= cnv;
end

assign start_recording = (counter==6'd2)?1:0;

//shift_out pulse
reg d3 = 0;

always @(posedge clk)
begin
    d3 <= cnv;
end

assign shift_out = (~d3)&cnv;
 
//shift_reg_reset pulse after sync
reg d4 = 0;

always @(posedge clk)
begin
    d4 <= sync;
end

assign shift_reg_reset = d4&(~sync); 
//-------------------------------//
        
endmodule
