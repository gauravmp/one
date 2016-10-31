onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+pll1 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.pll1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {pll1.udo}

run -all

endsim

quit -force
