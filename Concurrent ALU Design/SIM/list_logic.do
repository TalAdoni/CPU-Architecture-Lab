onerror {resume}
add list -width 12 /logictb/Y
add list /logictb/X
add list /logictb/ALUFN
add list /logictb/ALUout
add list /logictb/Nflag
add list /logictb/Cflag
add list /logictb/Zflag
add list /logictb/Vflag
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
