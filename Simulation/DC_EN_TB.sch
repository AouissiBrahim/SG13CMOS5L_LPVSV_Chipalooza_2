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
N -750 -370 -750 -310 {lab=VDD}
N -710 -310 -670 -310 {lab=#net1}
N -630 -370 -630 -310 {lab=VDD}
N -750 -370 -630 -370 {lab=VDD}
N -750 -410 -750 -370 {lab=VDD}
N -750 -270 -750 -250 {lab=#net1}
N -750 -190 -750 -170 {lab=GND}
N -710 -310 -710 -270 {lab=#net1}
N -750 -270 -710 -270 {lab=#net1}
N -750 -280 -750 -270 {lab=#net1}
N -590 -100 -530 -100 {lab=#net2}
N -630 -70 -630 -30 {lab=I_Bais}
N -670 -100 -630 -100 {lab=VSS}
N -630 -220 -630 -130 {lab=V1}
C {code_shown.sym} -1820 -519.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.options rshunt = 1e12
.options gmin=1e-9
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
C {lab_pin.sym} -910 -290 0 1 {name=p7 sig_type=std_logic lab=Rst
}
C {code.sym} -1360 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -1060 -340 1 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1140 -270 0 0 {name=p2 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -990 -400 1 0 {name=p3 sig_type=std_logic lab=I_Bais
}
C {vsource.sym} -1050 -590 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1050 -650 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -1000 -200 3 0 {name=p5 sig_type=std_logic lab=VSS
}
C {vsource.sym} -870 -590 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -910 -260 0 1 {name=p6 sig_type=std_logic lab=F_Rst
}
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
C {lab_pin.sym} -1010 110 0 0 {name=p8 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -1010 10 0 0 {name=p10 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -1010 70 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -1010 90 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -1010 30 2 1 {name=p14 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -990 0 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -1010 50 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {simulator_commands_shown.sym} -1830 80 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -970 -240 0 0 {name=x1
}
C {vsource.sym} -440 -300 0 0 {name=VSS1 value=0
savecurrent=false
}
C {gnd.sym} -440 -270 0 0 {name=l2 lab=GND}
C {ammeter.sym} -990 -370 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -440 -330 0 0 {name=p19 sig_type=std_logic lab=EN
}
C {sg13g2_pr/sg13_hv_nmos.sym} -610 -100 0 1 {name=M11
l=0.5u
w=0.5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_stdcells/sg13cmos5l_buf_1.sym} -490 -100 0 1 {name=x5 VDD=V1 VSS=VSS prefix=sg13cmos5l_ }
C {isource.sym} -750 -220 0 1 {name=I0 value=1u}
C {lab_pin.sym} -630 -30 0 0 {name=p12 sig_type=std_logic lab=I_Bais}
C {ammeter.sym} -630 -250 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -750 -410 2 0 {name=p18 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -730 -310 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -650 -310 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} -750 -170 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -450 -100 0 1 {name=p20 sig_type=std_logic lab=EN
}
C {lab_pin.sym} -670 -100 0 0 {name=p21 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -630 -190 0 0 {name=p22 sig_type=std_logic lab=V1
}
