onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /selector_testbench/dut/next
add wave -noupdate /selector_testbench/dut/clock
add wave -noupdate /selector_testbench/dut/reset
add wave -noupdate -expand /selector_testbench/dut/GrnPixels
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {682 ps} 0}
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
WaveRestoreZoom {0 ps} {2048 ps}
