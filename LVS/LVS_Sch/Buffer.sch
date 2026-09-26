v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1230 -460 -1210 -460 {lab=In}
N -990 -690 -990 -630 {lab=VDD}
N -1060 -600 -1030 -600 {lab=#net1}
N -1060 -460 -1030 -460 {lab=#net1}
N -1060 -520 -1060 -460 {lab=#net1}
N -1170 -520 -1170 -490 {lab=#net1}
N -1170 -690 -1170 -630 {lab=VDD}
N -1230 -600 -1210 -600 {lab=In}
N -1060 -600 -1060 -520 {lab=#net1}
N -1170 -570 -1170 -520 {lab=#net1}
N -1170 -520 -1060 -520 {lab=#net1}
N -1230 -600 -1230 -460 {lab=In}
N -1170 -690 -990 -690 {lab=VDD}
N -990 -570 -990 -490 {lab=Out}
N -1170 -370 -990 -370 {lab=VSS}
N -990 -600 -940 -600 {lab=PBulk}
N -1170 -600 -1120 -600 {lab=PBulk}
N -770 -620 -770 -590 {lab=PBulk}
N -770 -710 -770 -680 {lab=VDD}
N -1170 -460 -1170 -370 {lab=VSS}
N -990 -460 -990 -370 {lab=VSS}
C {sg13g2_pr/sg13_hv_nmos.sym} -1190 -460 0 0 {name=M4
l=1.25u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1010 -460 0 0 {name=M5
l=1.25u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1190 -600 0 0 {name=M6
l=1.25u
w=3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1010 -600 0 0 {name=M7
l=1.25u
w=3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -940 -600 0 1 {name=p8 sig_type=std_logic lab=PBulk}
C {lab_pin.sym} -1120 -600 0 1 {name=p9 sig_type=std_logic lab=PBulk}
C {lab_pin.sym} -770 -590 3 0 {name=p13 lab=PBulk}
C {sg13cmos5l_pr/ntap1_ring.sym} -770 -650 0 0 {name=R4
model=ntap1
spiceprefix=X
w=10.1e-6
l=4.8e-6
rw=0.3e-6
}
C {lab_pin.sym} -770 -710 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {iopin.sym} -1230 -520 0 1 {name=p4 lab=In}
C {iopin.sym} -990 -520 0 0 {name=p1 lab=Out}
C {iopin.sym} -1170 -690 0 1 {name=p2 lab=VDD}
C {iopin.sym} -1170 -370 0 1 {name=p3 lab=VSS}
