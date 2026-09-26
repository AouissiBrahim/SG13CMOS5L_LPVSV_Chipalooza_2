v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1140 -390 -1140 -370 {lab=VSS}
N -1100 -520 -1100 -500 {lab=F_RST}
N -1400 -460 -1400 -370 {lab=VSS}
N -1220 -520 -1100 -520 {lab=F_RST}
N -1270 -370 -1140 -370 {lab=VSS}
N -1270 -470 -1270 -370 {lab=VSS}
N -1400 -370 -1270 -370 {lab=VSS}
N -1430 -620 -1430 -590 {lab=#net1}
N -1550 -660 -1550 -550 {lab=VCORE}
N -1270 -660 -1270 -560 {lab=VCORE}
N -1620 -490 -1510 -490 {lab=VTH}
N -1550 -660 -1270 -660 {lab=VCORE}
N -1550 -550 -1510 -550 {lab=VCORE}
N -950 -720 -950 -690 {lab=PBulk}
N -950 -820 -950 -780 {lab=VDD}
N -900 -320 -860 -290 {lab=VDD}
N -900 -260 -860 -290 {lab=VDD}
N -960 -290 -900 -290 {lab=PBulk}
N -1820 -710 -1820 -600 {lab=VDD}
N -2010 -710 -2010 -600 {lab=VDD}
N -1970 -570 -1970 -530 {lab=#net1}
N -2010 -530 -1970 -530 {lab=#net1}
N -2010 -540 -2010 -530 {lab=#net1}
N -2010 -530 -2010 -410 {lab=#net1}
N -1970 -570 -1860 -570 {lab=#net1}
N -2130 -380 -2050 -380 {lab=I_Bais}
N -2170 -420 -2130 -420 {lab=I_Bais}
N -2170 -420 -2170 -410 {lab=I_Bais}
N -2170 -620 -2170 -420 {lab=I_Bais}
N -2170 -270 -2010 -270 {lab=VSS}
N -2010 -270 -1820 -270 {lab=VSS}
N -1820 -490 -1820 -450 {lab=VTH}
N -1860 -450 -1860 -390 {lab=VTH}
N -1820 -450 -1820 -420 {lab=VTH}
N -1860 -450 -1820 -450 {lab=VTH}
N -1620 -490 -1620 -420 {lab=VTH}
N -1820 -490 -1620 -490 {lab=VTH}
N -1820 -540 -1820 -490 {lab=VTH}
N -1820 -570 -1750 -570 {lab=PBulk}
N -2070 -570 -2010 -570 {lab=PBulk}
N -1970 -620 -1970 -570 {lab=#net1}
N -1970 -620 -1430 -620 {lab=#net1}
N -1820 -710 -1400 -710 {lab=VDD}
N -2010 -710 -1820 -710 {lab=VDD}
N -1400 -710 -1400 -590 {lab=VDD}
N -1400 -370 -1400 -270 {lab=VSS}
N -1620 -270 -1400 -270 {lab=VSS}
N -1820 -270 -1620 -270 {lab=VSS}
N -1580 -390 -1540 -390 {lab=#net2}
N -1460 -390 -1220 -390 {lab=F_RST}
N -1220 -520 -1220 -390 {lab=F_RST}
N -1210 -450 -1190 -450 {lab=I_Bais}
N -1210 -450 -1210 -300 {lab=I_Bais}
N -2130 -300 -1210 -300 {lab=I_Bais}
N -2130 -380 -2130 -300 {lab=I_Bais}
N -2130 -420 -2130 -380 {lab=I_Bais}
N -2010 -380 -2010 -270 {lab=VSS}
N -1820 -390 -1820 -270 {lab=VSS}
N -1620 -390 -1620 -270 {lab=VSS}
N -2170 -380 -2170 -270 {lab=VSS}
N -1030 -470 -1000 -470 {lab=#net3}
N -1030 -470 -1030 -450 {lab=#net3}
N -1030 -510 -1000 -510 {lab=F_RST}
N -1030 -520 -1030 -510 {lab=F_RST}
N -1100 -520 -1030 -520 {lab=F_RST}
C {iopin.sym} -1400 -710 0 0 {name=p5 lab=VDD}
C {lab_pin.sym} -950 -690 3 0 {name=p11 lab=PBulk}
C {sg13cmos5l_pr/ntap1_ring.sym} -950 -750 0 0 {name=R4
model=ntap1
spiceprefix=X
w=28.9e-6
l=6.6e-6
rw=0.3e-6
}
C {lab_pin.sym} -950 -820 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} -880 -290 0 1 {name=M3
l=3.52u
w=1.25u
ng=1
m=8
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -860 -290 0 1 {name=p18 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -960 -290 2 1 {name=p19 lab=PBulk}
C {iopin.sym} -2170 -270 0 1 {name=p22 lab=VSS}
C {iopin.sym} -2170 -620 1 1 {name=p23 lab=I_Bais}
C {sg13g2_pr/sg13_hv_pmos.sym} -1990 -570 0 1 {name=M5
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -2030 -380 0 0 {name=M9
l=1u
w=5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1840 -570 0 0 {name=M11
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1840 -390 0 0 {name=M12
l=7.6u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1600 -390 0 1 {name=M13
l=10u
w=0.4u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -1620 -490 3 0 {name=p9 lab=VTH}
C {lab_pin.sym} -2070 -570 0 0 {name=p24 lab=PBulk}
C {lab_pin.sym} -1750 -570 0 1 {name=p25 lab=PBulk}
C {sg13g2_pr/sg13_hv_nmos.sym} -2150 -380 0 1 {name=M6
l=1u
w=5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13cmos5l_stdcells/sg13cmos5l_buf_1.sym} -1500 -390 2 0 {name=x4 VDD=VTH VSS=VSS prefix=sg13cmos5l_ }
C {simulator_commands_shown.sym} -2180 -820 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include \\"/foss/pdks/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/cdl/sg13cmos5l_stdcell.cdl\\"
"
      }
C {/foss/designs/LPVSV_Chipalooza_2/GDS/LVS_Sch/Comp_2Stage.sym} -1350 -520 0 0 {name=x1}
C {/foss/designs/LPVSV_Chipalooza_2/GDS/LVS_Sch/Delay.sym} -1030 -420 0 0 {name=x2}
C {/foss/designs/LPVSV_Chipalooza_2/GDS/LVS_Sch/Buffer.sym} -1170 -520 0 0 {name=x3}
C {sg13cmos5l_stdcells/sg13cmos5l_and2_1.sym} -940 -490 0 0 {name=x5 VDD=VCORE VSS=VSS prefix=sg13cmos5l_ }
C {iopin.sym} -880 -490 0 0 {name=p1 lab=RST}
C {iopin.sym} -1270 -660 0 0 {name=p2 lab=VCORE}
C {iopin.sym} -1100 -520 3 0 {name=p3 lab=F_RST}
