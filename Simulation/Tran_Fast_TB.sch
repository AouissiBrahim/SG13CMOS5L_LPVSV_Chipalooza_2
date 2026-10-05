v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -950 -820 -150 -420 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=2.2u
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
y2=1.3
y1=-5.3194444e-09
sim_type=tran
color="4 5"
node="rst
vcore"
legend=1
x1=0}
N -1330 -810 -1330 -790 {lab=VDD}
N -1330 -730 -1330 -710 {lab=0}
N -1680 -340 -1680 -320 {lab=VCORE}
N -1680 -260 -1680 -240 {lab=0}
N -1170 -490 -1170 -480 {lab=VSS
}
N -1170 -810 -1170 -790 {lab=VSS}
N -1170 -730 -1170 -710 {lab=0}
N -340 -350 -340 -290 {lab=VDD}
N -300 -290 -260 -290 {lab=#net1}
N -220 -350 -220 -290 {lab=VDD}
N -340 -350 -220 -350 {lab=VDD}
N -340 -390 -340 -350 {lab=VDD}
N -340 -250 -340 -230 {lab=#net1}
N -340 -170 -340 -150 {lab=GND}
N -300 -290 -300 -250 {lab=#net1}
N -340 -250 -300 -250 {lab=#net1}
N -340 -260 -340 -250 {lab=#net1}
C {simulator_commands_shown.sym} -1740 -780 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.include sg13cmos5l_stdcell.spice
"
      }
C {vsource.sym} -1330 -760 0 0 {name=V1 value=\{VDD\} savecurrent=false}
C {lab_pin.sym} -1330 -810 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -1330 -710 0 0 {name=l2 lab=0}
C {lab_pin.sym} -1160 -630 0 1 {name=p4 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -1230 -630 0 1 {name=p5 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1680 -340 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1680 -240 0 0 {name=l3 lab=0
}
C {lab_pin.sym} -1310 -560 0 0 {name=p7 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -1080 -580 2 0 {name=p8 sig_type=std_logic lab=RST
}
C {lab_pin.sym} -1080 -550 2 0 {name=p9 sig_type=std_logic lab=F_RST
}
C {code_shown.sym} -1740 -650 0 0 {name=s1 only_toplevel=false 
value="
.options temp = 27
.param VDD = 3.3
.param I_Bais = 1u
.param t1 = t2-5n
.param t2 = 400n
.include Tran_TB_MC.save
.save all
.control
	tran 10n 2.2u
	plot vcore rst
write Tran_Fast_TB.raw
.endc
"
}
C {vsource.sym} -1170 -760 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1170 -810 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {gnd.sym} -1170 -710 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1170 -480 0 1 {name=p10 sig_type=std_logic lab=VSS
}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -1140 -530 0 0 {name=x1
}
C {simulator_commands_shown.sym} -1720 -120 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {lab_pin.sym} -920 -70 0 0 {name=p11 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -920 -170 0 0 {name=p12 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -920 -110 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -920 -90 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -920 -150 2 1 {name=p16 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -900 -180 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -920 -130 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {isource.sym} -340 -200 0 0 {name=I1 value=\{I_Bais\}}
C {lab_pin.sym} -340 -390 2 0 {name=p18 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -320 -290 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -240 -290 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} -340 -150 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -220 -260 3 0 {name=p19 sig_type=std_logic lab=I_Bais
}
C {vsource.sym} -1680 -290 0 0 {name=Vin1 value="pwl(0 1.2 100n 1.2 105n 0.6 \{t1\} 0.6 \{t2\} 1.2 2u 1.2)"
savecurrent=false
}
