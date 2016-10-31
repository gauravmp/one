// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Sun Oct 30 20:35:30 2016
// Host        : DESKTOP-U392PMO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {E:/HASP/GRID
//               Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/pll1_sim_netlist.v}
// Design      : pll1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module pll1
   (clk_in1,
    clk_out1,
    clk_out2,
    clk_out3,
    clk_out4,
    reset,
    locked);
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  input reset;
  output locked;

  (* IBUF_LOW_PWR *) wire clk_in1;
  wire clk_out1;
  wire clk_out2;
  wire clk_out3;
  wire clk_out4;
  wire locked;
  wire reset;

  pll1_pll1_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
        .clk_out3(clk_out3),
        .clk_out4(clk_out4),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "pll1_clk_wiz" *) 
module pll1_pll1_clk_wiz
   (clk_in1,
    clk_out1,
    clk_out2,
    clk_out3,
    clk_out4,
    reset,
    locked);
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  input reset;
  output locked;

  wire clk_in1;
  wire clk_in1_pll1;
  wire clk_out1;
  wire clk_out1_pll1;
  wire clk_out1_pll1_en_clk;
  wire clk_out2;
  wire clk_out2_pll1;
  wire clk_out2_pll1_en_clk;
  wire clk_out3;
  wire clk_out3_pll1;
  wire clk_out3_pll1_en_clk;
  wire clk_out4;
  wire clk_out4_pll1;
  wire clk_out4_pll1_en_clk;
  wire clkfbout_buf_pll1;
  wire clkfbout_pll1;
  wire locked;
  wire reset;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg1;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg2;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg3;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg4;
  wire NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_plle2_adv_inst_DRDY_UNCONNECTED;
  wire [15:0]NLW_plle2_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_pll1),
        .O(clkfbout_buf_pll1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_pll1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout1_buf
       (.CE0(seq_reg1[7]),
        .CE1(1'b0),
        .I0(clk_out1_pll1),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_out1),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout1_buf_en
       (.I(clk_out1_pll1),
        .O(clk_out1_pll1_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout2_buf
       (.CE0(seq_reg2[7]),
        .CE1(1'b0),
        .I0(clk_out2_pll1),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_out2),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout2_buf_en
       (.I(clk_out2_pll1),
        .O(clk_out2_pll1_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout3_buf
       (.CE0(seq_reg3[7]),
        .CE1(1'b0),
        .I0(clk_out3_pll1),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_out3),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout3_buf_en
       (.I(clk_out3_pll1),
        .O(clk_out3_pll1_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
    clkout4_buf
       (.CE0(seq_reg4[7]),
        .CE1(1'b0),
        .I0(clk_out4_pll1),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_out4),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFH clkout4_buf_en
       (.I(clk_out4_pll1),
        .O(clk_out4_pll1_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  PLLE2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT(42),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(10.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE(8),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(4),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(303.750000),
    .CLKOUT2_DIVIDE(84),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(4),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(5),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .STARTUP_WAIT("FALSE")) 
    plle2_adv_inst
       (.CLKFBIN(clkfbout_buf_pll1),
        .CLKFBOUT(clkfbout_pll1),
        .CLKIN1(clk_in1_pll1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(clk_out1_pll1),
        .CLKOUT1(clk_out2_pll1),
        .CLKOUT2(clk_out3_pll1),
        .CLKOUT3(clk_out4_pll1),
        .CLKOUT4(NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_plle2_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_plle2_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PWRDWN(1'b0),
        .RST(reset));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[0] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg1[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[1] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[2] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[3] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[4] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[5] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[6] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg1_reg[7] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[0] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg2[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[1] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[0]),
        .Q(seq_reg2[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[2] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[1]),
        .Q(seq_reg2[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[3] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[2]),
        .Q(seq_reg2[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[4] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[3]),
        .Q(seq_reg2[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[5] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[4]),
        .Q(seq_reg2[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[6] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[5]),
        .Q(seq_reg2[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg2_reg[7] 
       (.C(clk_out2_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg2[6]),
        .Q(seq_reg2[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[0] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg3[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[1] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[0]),
        .Q(seq_reg3[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[2] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[1]),
        .Q(seq_reg3[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[3] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[2]),
        .Q(seq_reg3[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[4] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[3]),
        .Q(seq_reg3[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[5] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[4]),
        .Q(seq_reg3[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[6] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[5]),
        .Q(seq_reg3[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg3_reg[7] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[6]),
        .Q(seq_reg3[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[0] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg4[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[1] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[0]),
        .Q(seq_reg4[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[2] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[1]),
        .Q(seq_reg4[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[3] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[2]),
        .Q(seq_reg4[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[4] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[3]),
        .Q(seq_reg4[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[5] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[4]),
        .Q(seq_reg4[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[6] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[5]),
        .Q(seq_reg4[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0)) 
    \seq_reg4_reg[7] 
       (.C(clk_out4_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg4[6]),
        .Q(seq_reg4[7]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
