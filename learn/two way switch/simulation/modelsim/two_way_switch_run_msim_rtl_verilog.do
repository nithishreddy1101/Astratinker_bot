transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Astratinker/learn/two\ way\ switch {C:/Astratinker/learn/two way switch/two_way_switch.v}

vlog -vlog01compat -work work +incdir+C:/Astratinker/learn/two\ way\ switch {C:/Astratinker/learn/two way switch/tb_TWS;.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"   tb_TWS;

add wave *
view structure
view signals
run -all
