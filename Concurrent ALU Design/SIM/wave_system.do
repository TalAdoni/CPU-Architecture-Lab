onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /systemtb/clock
add wave -noupdate /systemtb/Y
add wave -noupdate /systemtb/X
add wave -noupdate -color Red /systemtb/ALUFN
add wave -noupdate /systemtb/ALUout
add wave -noupdate -color Cyan /systemtb/Nflag
add wave -noupdate -color White /systemtb/Cflag
add wave -noupdate /systemtb/Zflag
add wave -noupdate -color Gold /systemtb/Vflag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {314158 ps} 0}
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
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {552120 ps}
