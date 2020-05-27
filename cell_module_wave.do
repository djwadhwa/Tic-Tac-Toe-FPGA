onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cell_module_testbench/dut/clock
add wave -noupdate /cell_module_testbench/dut/reset
add wave -noupdate /cell_module_testbench/dut/player
add wave -noupdate /cell_module_testbench/dut/select
add wave -noupdate /cell_module_testbench/dut/row
add wave -noupdate /cell_module_testbench/dut/col
add wave -noupdate -expand /cell_module_testbench/dut/red
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10217 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {24518 ps}
