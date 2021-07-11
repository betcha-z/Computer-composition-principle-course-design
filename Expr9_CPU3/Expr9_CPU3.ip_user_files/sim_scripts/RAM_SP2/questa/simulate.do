onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib RAM_SP2_opt

do {wave.do}

view wave
view structure
view signals

do {RAM_SP2.udo}

run -all

quit -force
