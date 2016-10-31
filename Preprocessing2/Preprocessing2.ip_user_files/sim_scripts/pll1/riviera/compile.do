vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../ipstatic/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/clk_wiz_v5_3_0" \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../ipstatic/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/clk_wiz_v5_3_0" "+incdir+../../../ipstatic/GRID Redesign/Code/Preprocessing2/Preprocessing2.srcs/sources_1/ip/pll1/clk_wiz_v5_3_0" \
"../../../../Preprocessing2.srcs/sources_1/ip/pll1/pll1_clk_wiz.v" \
"../../../../Preprocessing2.srcs/sources_1/ip/pll1/pll1.v" \

vlog -work xil_defaultlib "glbl.v"

