v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -870 -650 -870 -620 {lab=VCORE}
N -950 -650 -950 -620 {lab=VDD}
N -1050 -650 -1050 -620 {lab=VSS}
N -1180 -650 -1180 -580 {lab=VDD}
N -770 -650 -770 -620 {lab=EN}
C {code_shown.sym} -1820 -519.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.options rshunt = 1e12
.options gmin=1e-9
.include DC_TB.save
.save all
.control

dc Vin 1.3 0 -0.01
	plot RST VCORE title 'From Heigh to Low'
	plot i(vss)	
	meas dc VL when RST =0.2
	meas dc IQL max i(vss)
dc Vin 0 1.3 0.01
	plot RST VCORE title 'From Low to Heigh'
	meas dc VH when RST =0.95
	meas dc IQH max i(vss)

let Hes(mV) = (dc2.VH-dc1.VL)*1000
let VTH_L = dc1.VL
let VTH_H = dc2.VH
let IQL_Max = dc1.IQl
let IQH_Max = dc2.IQH
print VTH_H VTH_L
print Hes(mV)
print IQH_Max IQL_Max
.endc
"
}
C {lab_pin.sym} -870 -650 0 1 {name=p11 sig_type=std_logic lab=VCORE}
C {gnd.sym} -870 -560 0 0 {name=l9 lab=GND}
C {vsource.sym} -950 -590 0 0 {name=VDD value=3.3
savecurrent=false
}
C {lab_pin.sym} -950 -650 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {gnd.sym} -950 -560 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -840 -290 0 1 {name=p7 sig_type=std_logic lab=Rst
}
C {code.sym} -1360 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -990 -340 1 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1070 -270 0 0 {name=p2 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -920 -340 1 0 {name=p3 sig_type=std_logic lab=I_Bais
}
C {vsource.sym} -1050 -590 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1050 -650 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -930 -200 3 0 {name=p5 sig_type=std_logic lab=VSS
}
C {vsource.sym} -870 -590 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -840 -260 0 1 {name=p6 sig_type=std_logic lab=F_Rst
}
C {isource.sym} -1180 -550 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1180 -650 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {simulator_commands_shown.sym} -1820 -660 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.include sg13cmos5l_stdcell.spice
"
      }
C {lab_pin.sym} -1180 -520 3 0 {name=p9 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -980 90 0 0 {name=p8 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -980 -30 0 0 {name=p10 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -980 10 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -980 -10 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -980 70 2 1 {name=p14 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.sym} -960 -40 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -980 50 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {lab_pin.sym} -980 30 2 1 {name=p18 sig_type=std_logic lab=VTH
spice_ignore=true}
C {simulator_commands_shown.sym} -1800 40 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -900 -240 0 0 {name=x1
}
C {vsource.sym} -770 -590 0 0 {name=VSS1 value=0
savecurrent=false
}
C {lab_pin.sym} -770 -650 0 1 {name=p19 sig_type=std_logic lab=EN}
C {gnd.sym} -770 -560 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -1000 -200 0 0 {name=p20 sig_type=std_logic lab=EN}
