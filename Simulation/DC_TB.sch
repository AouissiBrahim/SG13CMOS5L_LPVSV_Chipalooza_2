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
N -1280 -460 -1280 -400 {lab=VDD}
N -1240 -400 -1200 -400 {lab=#net1}
N -1160 -460 -1160 -400 {lab=VDD}
N -1280 -460 -1160 -460 {lab=VDD}
N -1280 -500 -1280 -460 {lab=VDD}
N -1280 -360 -1280 -340 {lab=#net1}
N -1280 -280 -1280 -260 {lab=GND}
N -1240 -400 -1240 -360 {lab=#net1}
N -1280 -360 -1240 -360 {lab=#net1}
N -1280 -370 -1280 -360 {lab=#net1}
N -720 -650 -720 -620 {lab=VDD1}
C {code_shown.sym} -1900 -529.0983898104131 0 0 {name=s2 only_toplevel=false 
value="

.include DC_TB.save
.save all
.control

dc Vin 1.3 0 -0.01
	plot RST VCORE title 'From Heigh to Low'	
	plot EN I_Bais
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
C {code.sym} -1440 -690 0 0 {name=NGSPICE only_toplevel=true 
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
C {lab_pin.sym} -920 -400 1 0 {name=p3 sig_type=std_logic lab=I_Bais
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
C {isource.sym} -1280 -310 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1280 -500 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {simulator_commands_shown.sym} -1900 -680 0 0 {
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
C {lab_pin.sym} -1040 30 0 0 {name=p8 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -1040 -70 0 0 {name=p10 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -1040 -10 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -1040 10 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -1040 -50 2 1 {name=p14 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -1020 -80 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -1040 -30 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {simulator_commands_shown.sym} -1880 30 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -900 -240 0 0 {name=x1
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1260 -400 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1180 -400 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} -1280 -260 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -1160 -370 3 0 {name=p18 sig_type=std_logic lab=I_Bais
}
C {ammeter.sym} -920 -370 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {vsource.sym} -720 -590 0 0 {name=VDD1 value=1.2
savecurrent=false
}
C {lab_pin.sym} -720 -650 0 0 {name=p9 sig_type=std_logic lab=VDD1}
C {gnd.sym} -720 -560 0 0 {name=l4 lab=GND}
