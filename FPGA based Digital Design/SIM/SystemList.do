onerror {resume}
add list -width 41 /gpiotoptb/GPIOtop_ports/ALUFN_Reg_size
add list /gpiotoptb/SW7to0
add list /gpiotoptb/GPIOtop_ports/Y_Low_En
add list /gpiotoptb/GPIOtop_ports/Y_High_En
add list /gpiotoptb/GPIOtop_ports/X_Low_En
add list /gpiotoptb/GPIOtop_ports/X_High_En
add list /gpiotoptb/GPIOtop_ports/ALUFN_EN
add list -width 31 /gpiotoptb/GPIOtop_ports/LEDS
add list /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/Y_Value
add list /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/X_Value
add list /gpiotoptb/GPIOtop_ports/ALUout
add list /gpiotoptb/GPIOtop_ports/top_Ports/PWM_Label/PWM_Out
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
