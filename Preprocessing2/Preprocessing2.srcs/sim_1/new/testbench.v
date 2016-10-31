`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2016 11:19:16 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
  

wire locked;
reg clk = 0;
reg reset = 0;
//reg sdo = 1;
reg done = 0;
wire sdo;
wire[15:0] data_out;

pll1 pll_inst(
.clk_in1(clk),                  //100MHz
.clk_out1(clk105),              //105MHz for SCK
.clk_out2(clk210p),             //210MHz with 303 degrees phase shift for the shift_register
.clk_out3(clk10),               //10MHz clock to divide down to 5MHz for sync pulses
.clk_out4(clk210),              //210MHz clock
.locked(locked),
.reset(reset)
); 

wire[4:0] shift_count;
wire[2:0] shift_state;
shift_register shift_inst(
.clk(clk210p),
.shift_out(shift_out),
.sdo(sdo),
.start_recording(start_recording),
.data_out(data_out),
.read_data(read_data),
.shift_reg_reset(shift_reg_reset)
//debugging
//,
);

always #5 clk <= ~clk;

wire[5:0] counter;
pulse_generator inst(
.clk(clk),
.clk10(clk10),
.clk105(clk105),
.clk210(clk210),
.counter(counter),
.sync(sync),
.locked(locked),
.cnv(cnv),
.sck(sck),
.sck_gate(sck_gate),
.sync_gate(sync_gate),
.start_recording(start_recording),
.shift_out(shift_out),
.shift_reg_reset(shift_reg_reset),
.syn(syn)
);

assign sdo = (sck_gate)?1'd1:1'dx;
//always @(posedge clk10, posedge reset)  //not the right way to implement in a design; done here only for testing other module
//begin
//    sync <= ~sync;
//end

initial
begin
    reset <= 1;
    #500
    reset <= 0;
    #10000
    reset <= 1;
    #500
    reset <= 0;
end

//reg[7:0] count = 0;

////always @(posedge clk, posedge sync)
////begin
////    if(sync)
////        count <= 0;
////    else
////        count <= count + 1;
////end
    
////BAD PRACTICE. Only for simulation
//always @(posedge sync)
//begin
//    count <= 0;
//end

//always @(posedge clk)
//begin
//    count <= count + 1;
//    if(count == 19)
//        cnv <= 1;
//    else if(count == 3)
//        cnv <= 0;
//    else cnv <= cnv;
//end


    
endmodule
