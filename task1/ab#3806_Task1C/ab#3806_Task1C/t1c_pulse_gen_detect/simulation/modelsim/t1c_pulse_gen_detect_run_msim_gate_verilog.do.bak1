transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {t1c_pulse_gen_detect.vo}

vlog -vlog01compat -work work +incdir+C:/Astratinker/task1/t1c_pulse_gen_detect/t1c_pulse_gen_detect/simulation/modelsim {C:/Astratinker/task1/t1c_pulse_gen_detect/t1c_pulse_gen_detect/simulation/modelsim/tb.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 8 ms
