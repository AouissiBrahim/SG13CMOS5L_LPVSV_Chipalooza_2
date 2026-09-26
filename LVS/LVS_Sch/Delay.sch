v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -70 0 -30 {lab=OUT}
N -270 30 -240 30 {lab=IN}
N -200 -70 -200 -0 {lab=D}
N -200 -70 -160 -70 {lab=D}
N -160 -100 -160 -70 {lab=D}
N -160 -100 -40 -100 {lab=D}
N -200 -150 -0 -150 {lab=VDD}
N -470 160 -430 130 {lab=VSS}
N -470 100 -430 130 {lab=VSS}
N -530 130 -470 130 {lab=PBulk1}
N -200 -150 -200 -130 {lab=VDD}
N 0 -150 0 -130 {lab=VDD}
N -270 -100 -200 -100 {lab=PBulk}
N 0 -100 70 -100 {lab=PBulk}
N 180 -50 180 -20 {lab=PBulk}
N 180 -150 180 -110 {lab=VDD}
N -440 -30 -440 20 {lab=VSS}
N -440 -140 -440 -90 {lab=PBulk1}
N -0 10 -0 70 {lab=PBulk1}
N -50 10 -30 10 {lab=VSS}
N -50 40 -50 110 {lab=VSS}
N -200 110 -50 110 {lab=VSS}
N 30 10 50 10 {lab=VSS}
N 50 10 50 40 {lab=VSS}
N -50 40 50 40 {lab=VSS}
N -50 10 -50 40 {lab=VSS}
N 170 140 210 170 {lab=VDD}
N 170 200 210 170 {lab=VDD}
N 110 170 170 170 {lab=PBulk}
N -200 30 -200 110 {lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -100 0 0 {name=M7
l=1u
w=0.8u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 0 -150 0 0 {name=p1 lab=VDD}
C {iopin.sym} 0 -50 0 0 {name=p2 lab=OUT}
C {iopin.sym} -200 110 1 0 {name=p3 lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -10 3 1 {name=M8
l=10u
w=10u
ng=1
m=6
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -220 30 0 0 {name=M10
l=10u
w=0.5u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -270 30 2 0 {name=p4 lab=IN}
C {sg13g2_pr/sg13_lv_pmos.sym} -180 -100 0 1 {name=M2
l=1u
w=0.8u
ng=1
m=24
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} -530 130 0 0 {name=p5 lab=PBulk1}
C {lab_pin.sym} -430 130 2 0 {name=p10 lab=VSS}
C {lab_pin.sym} -270 -100 0 0 {name=p8 lab=PBulk}
C {lab_pin.sym} 70 -100 0 1 {name=p9 lab=PBulk}
C {lab_pin.sym} 180 -20 3 0 {name=p11 lab=PBulk}
C {sg13cmos5l_pr/ntap1_ring.sym} 180 -80 0 0 {name=R4
model=ntap1
spiceprefix=X
w=16.2e-6
l=12.8e-6
rw=0.3e-6
}
C {lab_pin.sym} 180 -150 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 0 70 3 0 {name=p14 lab=PBulk1}
C {lab_pin.sym} -440 -140 2 0 {name=p15 lab=PBulk1}
C {sg13cmos5l_pr/ntap1_ring.sym} -440 -60 2 0 {name=R3
model=ntap1
spiceprefix=X
w=68.1e-6
l=12.6e-6
rw=0.3e-6
}
C {lab_pin.sym} -440 20 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} -450 130 2 0 {name=M1
l=0.5u
w=10u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} -200 -30 0 0 {name=p17 lab=D}
C {sg13g2_pr/sg13_lv_pmos.sym} 190 170 0 1 {name=M3
l=1u
w=0.8u
ng=1
m=24
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 210 170 0 1 {name=p18 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 110 170 2 1 {name=p19 lab=PBulk}
