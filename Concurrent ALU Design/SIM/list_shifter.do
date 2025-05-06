onerror {resume}
add list -width 14 /shiftertb/Y
add list /shiftertb/X
add list /shiftertb/ALUFN
add list /shiftertb/ALUout
add list /shiftertb/Nflag
add list /shiftertb/Cflag
add list /shiftertb/Zflag
add list /shiftertb/Vflag
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
