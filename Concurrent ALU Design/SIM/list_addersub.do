onerror {resume}
add list -width 15 /addersubtb/Y
add list /addersubtb/X
add list /addersubtb/ALUFN
add list /addersubtb/ALUout
add list /addersubtb/Nflag
add list /addersubtb/Cflag
add list /addersubtb/Zflag
add list /addersubtb/Vflag
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
