onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pll1_opt

do {wave.do}

view wave
view structure
view signals

do {pll1.udo}

run -all

quit -force
