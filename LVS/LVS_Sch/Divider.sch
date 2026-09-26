v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -900 -80 -900 -30 {lab=VSS}
N 80 -70 80 -40 {lab=PBulk}
N 80 -170 80 -130 {lab=VDD}
N -900 -190 -900 -140 {lab=NBulk}
N 90 190 130 220 {lab=VDD}
N 90 250 130 220 {lab=VDD}
N 30 220 90 220 {lab=PBulk}
N -900 130 -860 160 {lab=VSS}
N -900 190 -860 160 {lab=VSS}
N -960 160 -900 160 {lab=NBulk}
N -310 -180 -310 -70 {lab=VDD}
N -500 -180 -500 -70 {lab=VDD}
N -460 -40 -460 0 {lab=V_B}
N -500 0 -460 0 {lab=V_B}
N -500 -10 -500 0 {lab=V_B}
N -500 0 -500 120 {lab=V_B}
N -460 -40 -350 -40 {lab=V_B}
N -620 150 -540 150 {lab=I_Bais}
N -660 110 -620 110 {lab=I_Bais}
N -660 110 -660 120 {lab=I_Bais}
N -500 -180 -310 -180 {lab=VDD}
N -660 -90 -660 110 {lab=I_Bais}
N -660 260 -500 260 {lab=VSS}
N -500 260 -310 260 {lab=VSS}
N -620 110 -620 150 {lab=I_Bais}
N -310 40 -310 80 {lab=VTH}
N -350 80 -350 140 {lab=VTH}
N -310 80 -310 110 {lab=VTH}
N -310 260 -110 260 {lab=VSS}
N -350 80 -310 80 {lab=VTH}
N -110 40 -110 110 {lab=VTH}
N -310 40 -110 40 {lab=VTH}
N -310 -10 -310 40 {lab=VTH}
N -310 170 -310 260 {lab=VSS}
N -500 180 -500 260 {lab=VSS}
N -660 180 -660 260 {lab=VSS}
N -110 170 -110 260 {lab=VSS}
N -720 150 -660 150 {lab=NBulk}
N -500 150 -440 150 {lab=NBulk}
N -310 140 -110 140 {lab=NBulk}
N -900 -140 -870 -140 {lab=NBulk}
N -900 -80 -870 -80 {lab=VSS}
N -310 -40 -240 -40 {lab=PBulk}
N -560 -40 -500 -40 {lab=PBulk}
N -900 210 -860 240 {lab=VSS}
N -900 270 -860 240 {lab=VSS}
N -960 240 -900 240 {lab=NBulk}
N -900 50 -860 80 {lab=VSS}
N -900 110 -860 80 {lab=VSS}
N -960 80 -900 80 {lab=NBulk}
C {iopin.sym} -310 -180 0 0 {name=p1 lab=VDD}
C {lab_pin.sym} -900 -30 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/ptap1_ring.sym} -900 -110 2 0 {name=R2
model=ptap1
spiceprefix=X
w=16.3e-6
l=5.2e-6
rw=0.3e-6
}
C {lab_pin.sym} 80 -40 3 0 {name=p11 lab=PBulk}
C {sg13cmos5l_pr/ntap1_ring.sym} 80 -100 0 0 {name=R4
model=ntap1
spiceprefix=X
w=28.9e-6
l=6.6e-6
rw=0.3e-6
}
C {lab_pin.sym} 80 -170 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} 110 220 0 1 {name=M3
l=3.52u
w=1.25u
ng=1
m=8
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 130 220 0 1 {name=p18 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 30 220 2 1 {name=p19 lab=PBulk}
C {sg13g2_pr/sg13_hv_nmos.sym} -880 160 0 1 {name=M4
l=0.5u
w=0.4u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -860 160 2 0 {name=p20 lab=VSS}
C {lab_pin.sym} -960 160 0 0 {name=p21 lab=NBulk}
C {iopin.sym} -900 -190 2 0 {name=p12 lab=NBulk}
C {iopin.sym} -660 260 0 1 {name=p22 lab=VSS}
C {iopin.sym} -660 -90 1 1 {name=p23 lab=I_Bais}
C {sg13g2_pr/sg13_hv_pmos.sym} -480 -40 0 1 {name=M5
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -520 150 0 0 {name=M9
l=1u
w=5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -330 -40 0 0 {name=M11
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -330 140 0 0 {name=M12
l=7.6u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -90 140 0 1 {name=M13
l=10u
w=0.4u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -110 40 0 0 {name=p2 lab=VTH}
C {iopin.sym} -70 140 0 0 {name=p3 lab=F_RST}
C {lab_pin.sym} -720 150 0 0 {name=p4 lab=NBulk}
C {lab_pin.sym} -440 150 0 1 {name=p5 lab=NBulk}
C {lab_pin.sym} -210 140 1 1 {name=p7 lab=NBulk}
C {sg13cmos5l_pr/ptap1_ring.sym} -870 -110 2 1 {name=R1
model=ptap1
spiceprefix=X
w=12.2e-6
l=6.3e-6
rw=0.3e-6
}
C {lab_pin.sym} -560 -40 0 0 {name=p8 lab=PBulk}
C {lab_pin.sym} -240 -40 0 1 {name=p9 lab=PBulk}
C {sg13g2_pr/sg13_hv_nmos.sym} -880 240 0 1 {name=M1
l=1.7u
w=1u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -860 240 2 0 {name=p10 lab=VSS}
C {lab_pin.sym} -960 240 0 0 {name=p14 lab=NBulk}
C {sg13g2_pr/sg13_hv_nmos.sym} -880 80 0 1 {name=M2
l=0.45u
w=3.54u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -860 80 2 0 {name=p15 lab=VSS}
C {lab_pin.sym} -960 80 0 0 {name=p16 lab=NBulk}
C {iopin.sym} -460 0 2 1 {name=p17 lab=V_B}
C {sg13g2_pr/sg13_hv_nmos.sym} -640 150 0 1 {name=M6
l=1u
w=5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
