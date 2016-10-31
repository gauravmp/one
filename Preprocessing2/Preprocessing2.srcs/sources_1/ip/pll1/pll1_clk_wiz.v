
// file: pll1.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// clk_out1___105.000______0.000______50.0______284.796____310.955
// clk_out2___210.000____303.750______50.0______256.770____310.955
// clk_out3____10.000______0.000______50.0______433.844____310.955
// clk_out4___210.000______0.000______50.0______256.770____310.955
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps

module pll1_clk_wiz 

 (// Clock in ports
  input         clk_in1,
  // Clock out ports
  output        clk_out1,
  output        clk_out2,
  output        clk_out3,
  output        clk_out4,
  // Status and control signals
  input         reset,
  output        locked
 );
  // Input buffering
  //------------------------------------
wire clk_in1_pll1;
wire clk_in2_pll1;
  IBUF clkin1_ibufg
   (.O (clk_in1_pll1),
    .I (clk_in1));


  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out1_pll1;
  wire        clk_out2_pll1;
  wire        clk_out3_pll1;
  wire        clk_out4_pll1;
  wire        clk_out5_pll1;
  wire        clk_out6_pll1;
  wire        clk_out7_pll1;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_pll1;
  wire        clkfbout_buf_pll1;
  wire        clkfboutb_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg1 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg2 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg3 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg4 = 0;

  PLLE2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .COMPENSATION         ("ZHOLD"),
    .DIVCLK_DIVIDE        (5),
    .CLKFBOUT_MULT        (42),
    .CLKFBOUT_PHASE       (0.000),
    .CLKOUT0_DIVIDE       (8),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT1_DIVIDE       (4),
    .CLKOUT1_PHASE        (303.750),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT2_DIVIDE       (84),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT3_DIVIDE       (4),
    .CLKOUT3_PHASE        (0.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKIN1_PERIOD        (10.0))
  plle2_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_pll1),
    .CLKOUT0             (clk_out1_pll1),
    .CLKOUT1             (clk_out2_pll1),
    .CLKOUT2             (clk_out3_pll1),
    .CLKOUT3             (clk_out4_pll1),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_pll1),
    .CLKIN1              (clk_in1_pll1),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Other control and status signals
    .LOCKED              (locked_int),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));

  assign reset_high = reset; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_pll1),
    .I (clkfbout_pll1));




  BUFGCE clkout1_buf
   (.O   (clk_out1),
    .CE  (seq_reg1[7]),
    .I   (clk_out1_pll1));
 
  BUFH clkout1_buf_en
   (.O   (clk_out1_pll1_en_clk),
    .I   (clk_out1_pll1));

  always @(posedge clk_out1_pll1_en_clk)
        seq_reg1 <= {seq_reg1[6:0],locked_int};


  BUFGCE clkout2_buf
   (.O   (clk_out2),
    .CE  (seq_reg2[7]),
    .I   (clk_out2_pll1));
 
  BUFH clkout2_buf_en
   (.O   (clk_out2_pll1_en_clk),
    .I   (clk_out2_pll1));
 
  always @(posedge clk_out2_pll1_en_clk)
        seq_reg2 <= {seq_reg2[6:0],locked_int};


  BUFGCE clkout3_buf
   (.O   (clk_out3),
    .CE  (seq_reg3[7]),
    .I   (clk_out3_pll1));
 
  BUFH clkout3_buf_en
   (.O   (clk_out3_pll1_en_clk),
    .I   (clk_out3_pll1));
 
  always @(posedge clk_out3_pll1_en_clk)
        seq_reg3 <= {seq_reg3[6:0],locked_int};


  BUFGCE clkout4_buf
   (.O   (clk_out4),
    .CE  (seq_reg4[7]),
    .I   (clk_out4_pll1));
 
  BUFH clkout4_buf_en
   (.O   (clk_out4_pll1_en_clk),
    .I   (clk_out4_pll1));
 
  always @(posedge clk_out4_pll1_en_clk)
        seq_reg4 <= {seq_reg4[6:0],locked_int};





endmodule
