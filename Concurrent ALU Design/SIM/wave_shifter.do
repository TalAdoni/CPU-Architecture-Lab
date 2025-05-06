onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shiftertb/clock
add wave -noupdate /shiftertb/Y
add wave -noupdate /shiftertb/X
add wave -noupdate -color Blue /shiftertb/ALUFN
add wave -noupdate /shiftertb/ALUout
add wave -noupdate /shiftertb/Nflag
add wave -noupdate -color Gold /shiftertb/Cflag
add wave -noupdate /shiftertb/Zflag
add wave -noupdate -color Red /shiftertb/Vflag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10202 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {512 ns}
