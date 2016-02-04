onerror {quit -f}
vlib work
vlog -work work QuadratureEncoderTop.vo
vlog -work work QuadratureEncoderTop.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.QuadratureEncoderTop_vlg_vec_tst
vcd file -direction QuadratureEncoderTop.msim.vcd
vcd add -internal QuadratureEncoderTop_vlg_vec_tst/*
vcd add -internal QuadratureEncoderTop_vlg_vec_tst/i1/*
add wave /*
run -all
