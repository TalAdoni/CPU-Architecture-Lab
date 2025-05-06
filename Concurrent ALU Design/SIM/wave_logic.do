onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /logictb/clock
add wave -noupdate /logictb/Y
add wave -noupdate /logictb/X
add wave -noupdate -color Gold /logictb/ALUFN
add wave -noupdate /logictb/ALUout
add wave -noupdate -color Cyan /logictb/Nflag
add wave -noupdate -color Red /logictb/Cflag
add wave -noupdate -color Magenta /logictb/Zflag
add wave -noupdate /logictb/Vflag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40 ps} 0}
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
WaveRestoreZoom {2999050 ps} {3000050 ps}
