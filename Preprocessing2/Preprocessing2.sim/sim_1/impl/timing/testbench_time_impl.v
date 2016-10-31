// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Sun Oct 30 16:46:37 2016
// Host        : DESKTOP-U392PMO running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {E:/HASP/GRID
//               Redesign/Code/Preprocessing2/Preprocessing2.sim/sim_1/impl/timing/testbench_time_impl.v}
// Design      : preprocessing_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module pll1
   (clk_in1,
    clk_out1,
    clk_out2,
    clk_out3,
    reset,
    locked);
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  input reset;
  output locked;

  (* IBUF_LOW_PWR *) wire clk_in1;
  wire clk_out1;
  wire clk_out3;
  wire locked;
  wire reset;
  wire NLW_inst_clk_out2_UNCONNECTED;

  pll1_pll1_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1),
        .clk_out2(NLW_inst_clk_out2_UNCONNECTED),
        .clk_out3(clk_out3),
        .locked(locked),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "pll1_clk_wiz" *) 
module pll1_pll1_clk_wiz
   (clk_in1,
    clk_out1,
    clk_out2,
    clk_out3,
    reset,
    locked);
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  input reset;
  output locked;

  wire clk_in1;
  wire clk_out1;
  wire clk_out1_pll1;
  wire clk_out1_pll1_en_clk;
  wire clk_out3;
  wire clk_out3_pll1;
  wire clk_out3_pll1_en_clk;
  wire clkfbout_buf_pll1;
  wire clkfbout_pll1;
  wire locked;
  wire reset;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg1;
  (* ASYNC_REG = "true" *) (* RTL_KEEP = "true" *) wire [7:0]seq_reg3;
  wire NLW_plle2_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_plle2_adv_inst_DRDY_UNCONNECTED;
  wire [15:0]NLW_plle2_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_pll1),
        .O(clkfbout_buf_pll1));
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
    .CLKOUT3_DIVIDE(1),
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
        .CLKIN1(clk_in1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKOUT0(clk_out1_pll1),
        .CLKOUT1(NLW_plle2_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT2(clk_out3_pll1),
        .CLKOUT3(NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED),
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
  initial assign \seq_reg1_reg[0] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[0] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg1[0]),
        .R(1'b0));
  initial assign \seq_reg1_reg[1] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[1] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]),
        .R(1'b0));
  initial assign \seq_reg1_reg[2] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[2] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]),
        .R(1'b0));
  initial assign \seq_reg1_reg[3] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[3] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]),
        .R(1'b0));
  initial assign \seq_reg1_reg[4] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[4] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]),
        .R(1'b0));
  initial assign \seq_reg1_reg[5] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[5] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]),
        .R(1'b0));
  initial assign \seq_reg1_reg[6] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[6] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]),
        .R(1'b0));
  initial assign \seq_reg1_reg[7] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[7] 
       (.C(clk_out1_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]),
        .R(1'b0));
  initial assign \seq_reg3_reg[0] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[0] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(locked),
        .Q(seq_reg3[0]),
        .R(1'b0));
  initial assign \seq_reg3_reg[1] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[1] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[0]),
        .Q(seq_reg3[1]),
        .R(1'b0));
  initial assign \seq_reg3_reg[2] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[2] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[1]),
        .Q(seq_reg3[2]),
        .R(1'b0));
  initial assign \seq_reg3_reg[3] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[3] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[2]),
        .Q(seq_reg3[3]),
        .R(1'b0));
  initial assign \seq_reg3_reg[4] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[4] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[3]),
        .Q(seq_reg3[4]),
        .R(1'b0));
  initial assign \seq_reg3_reg[5] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[5] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[4]),
        .Q(seq_reg3[5]),
        .R(1'b0));
  initial assign \seq_reg3_reg[6] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[6] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[5]),
        .Q(seq_reg3[6]),
        .R(1'b0));
  initial assign \seq_reg3_reg[7] .notifier = 1'bx;
(* ASYNC_REG *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg3_reg[7] 
       (.C(clk_out3_pll1_en_clk),
        .CE(1'b1),
        .D(seq_reg3[6]),
        .Q(seq_reg3[7]),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "ba135f62" *) 
(* NotValidForBitStream *)
module preprocessing_top
   (clk,
    sck,
    sdo,
    cnv);
  input clk;
  output sck;
  input sdo;
  output cnv;

  wire clk;
  wire clk10;
  wire clk105;
  wire clk_IBUF;
  wire cnv;
  wire cnv_OBUF;
  wire locked;
  wire sck;
  wire sck_OBUF;
  wire NLW_pll_inst_clk_out2_UNCONNECTED;

initial begin
 $sdf_annotate("testbench_time_impl.sdf",,,,"tool_control");
end
  (* OPT_INSERTED *) 
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF cnv_OBUF_inst
       (.I(cnv_OBUF),
        .O(cnv));
  pulse_generator inst
       (.clk(clk_IBUF),
        .clk_out1(clk105),
        .clk_out3(clk10),
        .cnv_OBUF(cnv_OBUF),
        .locked(locked),
        .sck_OBUF(sck_OBUF));
  pll1 pll_inst
       (.clk_in1(clk_IBUF),
        .clk_out1(clk105),
        .clk_out2(NLW_pll_inst_clk_out2_UNCONNECTED),
        .clk_out3(clk10),
        .locked(locked),
        .reset(1'b0));
  OBUF sck_OBUF_inst
       (.I(sck_OBUF),
        .O(sck));
endmodule

module pulse_generator
   (cnv_OBUF,
    sck_OBUF,
    clk_out3,
    clk,
    clk_out1,
    locked);
  output cnv_OBUF;
  output sck_OBUF;
  input clk_out3;
  input clk;
  input clk_out1;
  input locked;

  wire clk;
  wire clk_out1;
  wire clk_out3;
  wire cnv2_reg_srl2_n_0;
  wire cnv3;
  wire cnv_OBUF;
  wire \counter[5]_i_2_n_0 ;
  wire [5:0]counter_reg__0;
  wire d1;
  wire locked;
  wire [5:0]p_0_in;
  wire sck_OBUF;
  wire sck_gate1_in;
  wire sck_gate__4;
  wire sck_gate_i_1_n_0;
  wire sck_gate_reg_n_0;
  wire syn;
  wire syn_i_1_n_0;

  (* srl_name = "\inst/cnv2_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    cnv2_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_out1),
        .D(syn),
        .Q(cnv2_reg_srl2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cnv3_reg
       (.C(clk_out1),
        .CE(1'b1),
        .D(cnv2_reg_srl2_n_0),
        .Q(cnv3),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    cnv_OBUF_inst_i_1
       (.I0(syn),
        .I1(cnv3),
        .O(cnv_OBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter_reg__0[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter_reg__0[0]),
        .I1(counter_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter[2]_i_1 
       (.I0(counter_reg__0[0]),
        .I1(counter_reg__0[1]),
        .I2(counter_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter[3]_i_1 
       (.I0(counter_reg__0[1]),
        .I1(counter_reg__0[0]),
        .I2(counter_reg__0[2]),
        .I3(counter_reg__0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \counter[4]_i_1 
       (.I0(counter_reg__0[2]),
        .I1(counter_reg__0[0]),
        .I2(counter_reg__0[1]),
        .I3(counter_reg__0[3]),
        .I4(counter_reg__0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter[5]_i_1 
       (.I0(counter_reg__0[3]),
        .I1(counter_reg__0[1]),
        .I2(counter_reg__0[0]),
        .I3(counter_reg__0[2]),
        .I4(counter_reg__0[4]),
        .I5(counter_reg__0[5]),
        .O(p_0_in[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \counter[5]_i_2 
       (.I0(syn),
        .I1(d1),
        .O(\counter[5]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(counter_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(counter_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(counter_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(counter_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(counter_reg__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_out1),
        .CE(1'b1),
        .CLR(\counter[5]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(counter_reg__0[5]));
  FDRE #(
    .INIT(1'b0)) 
    d1_reg
       (.C(clk),
        .CE(1'b1),
        .D(syn),
        .Q(d1),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h7)) 
    sck_OBUF_inst_i_1
       (.I0(clk_out1),
        .I1(sck_gate_reg_n_0),
        .O(sck_OBUF));
  LUT4 #(
    .INIT(16'hF4CC)) 
    sck_gate_i_1
       (.I0(sck_gate1_in),
        .I1(sck_gate_reg_n_0),
        .I2(sck_gate__4),
        .I3(locked),
        .O(sck_gate_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    sck_gate_i_2
       (.I0(counter_reg__0[5]),
        .I1(counter_reg__0[0]),
        .I2(counter_reg__0[4]),
        .I3(counter_reg__0[1]),
        .I4(counter_reg__0[3]),
        .I5(counter_reg__0[2]),
        .O(sck_gate1_in));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    sck_gate_i_3
       (.I0(counter_reg__0[5]),
        .I1(counter_reg__0[4]),
        .I2(counter_reg__0[0]),
        .I3(counter_reg__0[1]),
        .I4(counter_reg__0[3]),
        .I5(counter_reg__0[2]),
        .O(sck_gate__4));
  FDRE #(
    .INIT(1'b0)) 
    sck_gate_reg
       (.C(clk_out1),
        .CE(1'b1),
        .D(sck_gate_i_1_n_0),
        .Q(sck_gate_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    syn_i_1
       (.I0(syn),
        .O(syn_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    syn_reg
       (.C(clk_out3),
        .CE(1'b1),
        .D(syn_i_1_n_0),
        .Q(syn),
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
