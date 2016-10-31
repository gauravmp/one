`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2016 10:40:14 PM
// Design Name: 
// Module Name: preprocessing_top
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


module preprocessing_top(
clk,
sck,
sdo,
cnv
    );
    
input clk;                      //100MHz    
input sdo;

output sck;   
output cnv;   
   
wire clk105, clk105p72, clk105p230,clk210, clk10;
reg reset = 0;
     
pll1 pll_inst(
.clk_in1(clk),                  //100MHz
.clk_out1(clk105),              //105MHz for SCK
.clk_out2(clk210p),             //210MHz with 303 degrees phase shift for the shift_register
.clk_out3(clk10),               //10MHz clock to divide down to 5MHz for sync pulses
.clk_out4(clk210),              //210MHz clock
.locked(locked),
.reset(reset)
); 

wire[5:0] counter;
pulse_generator inst(
.clk(clk),
.clk10(clk10),
.clk105(clk105),
.clk210(clk210),
.sync(sync),
.locked(locked),
.cnv(cnv),
.sck(sck),
.start_recording(start_recording),
.shift_out(shift_out),
.reset(reset),
.shift_reg_reset(shift_reg_reset),
.time_tag(time_tag)
);

shift_register shift_inst(
.clk(clk210p),
.shift_out(shift_out),
.sdo(sdo),
.start_recording(start_recording),
.data_out(data_out),
.read_data(read_data),
.sync(sync),
.shift_reg_reset(shift_reg_reset)
);

//uart uart(
//.clk(clk),
//.rst(reset),
//.tx(tx),
//.data(tx_data),
//.tx_en(tx_en),
//.tx_done(tx_done)
//);


    
endmodule
