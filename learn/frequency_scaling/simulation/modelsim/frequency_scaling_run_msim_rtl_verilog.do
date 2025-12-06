transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Astratinker/learn/frequency_scaling {C:/Astratinker/learn/frequency_scaling/frequency_scaling.v}

