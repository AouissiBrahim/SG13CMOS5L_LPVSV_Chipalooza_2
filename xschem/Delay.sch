v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -70 0 -30 {lab=OUT}
N 0 10 30 10 {lab=VSS}
N 0 10 0 80 {lab=VSS}
N -30 10 0 10 {lab=VSS}
N -200 30 -200 80 {lab=VSS}
N -270 30 -240 30 {lab=IN}
N -200 -150 -200 -100 {lab=VDD}
N -200 -70 -200 -0 {lab=#net1}
N -200 -70 -160 -70 {lab=#net1}
N -160 -100 -160 -70 {lab=#net1}
N 0 -150 0 -100 {lab=VDD}
N -160 -100 -40 -100 {lab=#net1}
N -200 -150 -0 -150 {lab=VDD}
N -200 80 0 80 {lab=VSS}
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
C {iopin.sym} -90 80 1 0 {name=p3 lab=VSS}
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
