v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 140 40 140 {lab=#net1}
N 0 90 0 140 {lab=#net1}
N -40 140 0 140 {lab=#net1}
N -80 90 -80 110 {lab=#net1}
N -80 90 0 90 {lab=#net1}
N -80 0 -80 90 {lab=#net1}
N 80 60 80 110 {lab=#net2}
N -10 -130 80 -130 {lab=#net3}
N -290 -60 -290 -30 {lab=PBulk1
}
N -600 -50 -560 -80 {lab=VDD}
N -600 -50 -560 -20 {lab=VDD}
N -560 -50 -480 -50 {lab=PBulk1}
N 80 220 290 220 {lab=VSS}
N -80 220 80 220 {lab=VSS}
N 80 60 200 60 {lab=#net2}
N 80 0 80 60 {lab=#net2}
N 200 60 200 140 {lab=#net2}
N 200 140 250 140 {lab=#net2}
N -10 -170 -10 -130 {lab=#net3}
N -80 -130 -10 -130 {lab=#net3}
N -10 -200 30 -200 {lab=PBulk}
N -10 -250 -10 -230 {lab=VDD}
N -10 -250 290 -250 {lab=VDD}
N 290 -170 290 110 {lab=OUT}
N 290 -200 330 -200 {lab=PBulk}
N 290 -250 290 -230 {lab=VDD}
N -600 -130 -560 -160 {lab=VDD}
N -600 -130 -560 -100 {lab=VDD}
N -560 -130 -480 -130 {lab=PBulk}
N -290 -250 -10 -250 {lab=VDD}
N -290 -250 -290 -120 {lab=VDD}
N -360 -120 -290 -120 {lab=VDD}
N -360 -60 -360 -30 {lab=PBulk}
N 290 140 290 220 {lab=VSS}
N 80 140 80 220 {lab=VSS}
N -80 140 -80 220 {lab=VSS}
N -80 -130 -80 -60 {lab=#net3}
N 80 -130 80 -60 {lab=#net3}
N 0 -30 80 -30 {lab=PBulk1}
N 0 -90 0 -30 {lab=PBulk1}
N -80 -30 0 -30 {lab=PBulk1}
C {sg13g2_pr/sg13_hv_nmos.sym} -60 140 0 1 {name=M2
l=10u
w=5u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 60 140 0 0 {name=M4
l=10u
w=5u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} 290 -30 0 0 {name=p7 lab=OUT}
C {iopin.sym} 290 220 0 0 {name=p8 lab=VSS}
C {sg13g2_pr/sg13_hv_pmos.sym} -100 -30 0 0 {name=M1
l=2u
w=20u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 100 -30 0 1 {name=M3
l=2u
w=20u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {iopin.sym} 290 -250 0 0 {name=p3 lab=VDD}
C {iopin.sym} 120 -30 0 0 {name=p5 lab=VinP}
C {iopin.sym} -120 -30 0 1 {name=p9 lab=VinN}
C {lab_pin.sym} -360 -30 3 0 {name=p11 lab=PBulk}
C {sg13g2_pr/sg13_hv_pmos.sym} -580 -50 0 0 {name=M8
l=2u
w=20u
ng=2
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -480 -50 0 1 {name=p19 lab=PBulk1}
C {lab_pin.sym} -600 -50 0 0 {name=p21 lab=VDD}
C {sg13cmos5l_pr/ntap1_ring.sym} -290 -90 0 0 {name=R2
model=ntap1
spiceprefix=X
w=27.1e-6
l=25.55e-6
rw=0.3e-6
}
C {sg13g2_pr/sg13_hv_nmos.sym} 270 140 0 0 {name=M6
l=10u
w=5u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -30 -200 0 0 {name=M7
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 30 -200 0 1 {name=p14 lab=PBulk}
C {sg13g2_pr/sg13_hv_pmos.sym} 270 -200 0 0 {name=M10
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} 330 -200 0 1 {name=p16 lab=PBulk}
C {lab_pin.sym} 250 -200 0 0 {name=p17 lab=I_Bais}
C {iopin.sym} -50 -200 0 1 {name=p15 lab=I_Bais}
C {sg13g2_pr/sg13_hv_pmos.sym} -580 -130 0 0 {name=M11
l=1u
w=2.5u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -480 -130 0 1 {name=p18 lab=PBulk}
C {lab_pin.sym} -600 -130 0 0 {name=p23 lab=VDD}
C {sg13cmos5l_pr/ntap1_ring.sym} -360 -90 0 0 {name=R4
model=ntap1
spiceprefix=X
w=11.4e-6
l=9.7e-6
rw=0.3e-6
}
C {lab_pin.sym} -290 -30 3 0 {name=p24 lab=PBulk1
}
C {lab_pin.sym} 0 -90 0 0 {name=p1 lab=PBulk1
}
