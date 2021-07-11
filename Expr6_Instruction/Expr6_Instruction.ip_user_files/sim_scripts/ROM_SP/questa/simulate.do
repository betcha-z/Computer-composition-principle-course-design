onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ROM_SP_opt

do {wave.do}

view wave
view structure
view signals

do {ROM_SP.udo}

run -all

quit -force
