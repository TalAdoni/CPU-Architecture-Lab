onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /gpiotoptb/GPIOtop_ports/Inclk
add wave -noupdate -color Gold /gpiotoptb/GPIOtop_ports/Clk
add wave -noupdate -color Gold /gpiotoptb/GPIOtop_ports/rst
add wave -noupdate -color Gold /gpiotoptb/GPIOtop_ports/enable
add wave -noupdate -group KEYS -color Magenta /gpiotoptb/GPIOtop_ports/KEY0
add wave -noupdate -group KEYS -color Magenta /gpiotoptb/GPIOtop_ports/KEY1
add wave -noupdate -group KEYS -color Magenta /gpiotoptb/GPIOtop_ports/KEY2
add wave -noupdate -group KEYS /gpiotoptb/GPIOtop_ports/rst
add wave -noupdate -group SW /gpiotoptb/GPIOtop_ports/enable
add wave -noupdate -group SW /gpiotoptb/GPIOtop_ports/SW9
add wave -noupdate -group SW /gpiotoptb/SW8
add wave -noupdate -group SW /gpiotoptb/GPIOtop_ports/SW7to0
add wave -noupdate /gpiotoptb/GPIOtop_ports/LEDS
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX0
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX1
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX2
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX3
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX4
add wave -noupdate -expand -group HEX -radix hexadecimal /gpiotoptb/GPIOtop_ports/HEX5
add wave -noupdate -group Flags /gpiotoptb/GPIOtop_ports/Nflag
add wave -noupdate -group Flags /gpiotoptb/GPIOtop_ports/Cflag
add wave -noupdate -group Flags /gpiotoptb/GPIOtop_ports/Zflag
add wave -noupdate -group Flags /gpiotoptb/GPIOtop_ports/Vflag
add wave -noupdate -expand -group X,Y,ALUFN -color Cyan -radix decimal /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/X_Value
add wave -noupdate -expand -group X,Y,ALUFN -color Cyan -radix decimal /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/Y_Value
add wave -noupdate -expand -group X,Y,ALUFN -color Violet /gpiotoptb/GPIOtop_ports/ALUFN_Reg_size
add wave -noupdate -expand -group X,Y,ALUFN /gpiotoptb/GPIOtop_ports/Y_High
add wave -noupdate -expand -group X,Y,ALUFN /gpiotoptb/GPIOtop_ports/Y_Low
add wave -noupdate -expand -group X,Y,ALUFN /gpiotoptb/GPIOtop_ports/X_High
add wave -noupdate -expand -group X,Y,ALUFN /gpiotoptb/GPIOtop_ports/X_Low
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/X_notDecoded
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/y_notDecoded
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/ALUout_notDecoded
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/ALUout_Decoded
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/X_Decoded
add wave -noupdate -group {Decode/not Decoded inputs} /gpiotoptb/GPIOtop_ports/y_Decoded
add wave -noupdate -group Enables /gpiotoptb/GPIOtop_ports/Y_Low_En
add wave -noupdate -group Enables /gpiotoptb/GPIOtop_ports/Y_High_En
add wave -noupdate -group Enables /gpiotoptb/GPIOtop_ports/X_Low_En
add wave -noupdate -group Enables /gpiotoptb/GPIOtop_ports/X_High_En
add wave -noupdate -group Enables /gpiotoptb/GPIOtop_ports/ALUFN_EN
add wave -noupdate -color Khaki -radix decimal -radixshowbase 0 /gpiotoptb/GPIOtop_ports/ALUout
add wave -noupdate -group {PWM module} -color Cyan -radix decimal /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/X_Value
add wave -noupdate -group {PWM module} -color Cyan -radix decimal /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/Y_Value
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_Mod
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/rst
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/clk
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/enable
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_Out
add wave -noupdate -group {PWM module} -color Cyan -radix unsigned /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/counter_out
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/EQUY
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_signal
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_SetReset
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_ResetSet
add wave -noupdate -group {PWM module} /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_Toggle
add wave -noupdate /gpiotoptb/SW7to0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35000000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 370
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
WaveRestoreZoom {21119785 ps} {106629144 ps}
