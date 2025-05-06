onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /addersubtb/clock
add wave -noupdate /addersubtb/Y
add wave -noupdate /addersubtb/X
add wave -noupdate -color {Medium Spring Green} /addersubtb/ALUFN
add wave -noupdate -color White /addersubtb/ALUout
add wave -noupdate -color Gold /addersubtb/Nflag
add wave -noupdate -color Cyan /addersubtb/Cflag
add wave -noupdate -color Red /addersubtb/Zflag
add wave -noupdate /addersubtb/Vflag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32496 ps} 0}
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
