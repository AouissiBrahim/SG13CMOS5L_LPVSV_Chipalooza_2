v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -840 -860 -40 -460 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=0.009
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
y2=1.3
y1=0
sim_type=tran
color="6 5 4"
node="rst
f_rst
vcore"
legend=1
x1=0}
B 2 -840 -460 -40 -60 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=600n
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=1
y2=1.3
sim_type=tran
x1=0
legend=1
y1=0
color="4 5"
node="rst
vcore"}
N -1270 -790 -1270 -770 {lab=VDD}
N -1270 -710 -1270 -690 {lab=0}
N -1110 -790 -1110 -770 {lab=VSS}
N -1110 -710 -1110 -690 {lab=0}
N -1180 -570 -1180 -510 {lab=VDD}
N -1140 -510 -1100 -510 {lab=#net1}
N -1060 -570 -1060 -510 {lab=VDD}
N -1180 -570 -1060 -570 {lab=VDD}
N -1180 -610 -1180 -570 {lab=VDD}
N -1180 -470 -1180 -450 {lab=#net1}
N -1180 -390 -1180 -370 {lab=GND}
N -1140 -510 -1140 -470 {lab=#net1}
N -1180 -470 -1140 -470 {lab=#net1}
N -1180 -480 -1180 -470 {lab=#net1}
C {simulator_commands_shown.sym} -1740 -830 0 0 {
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
C {isource.sym} -1180 -420 0 1 {name=I0 value=\{I_Bais\}}
C {vsource.sym} -1270 -740 0 0 {name=V1 value=\{VDD\} savecurrent=false}
C {lab_pin.sym} -1270 -790 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -1270 -690 0 0 {name=l2 lab=0}
C {lab_pin.sym} -1060 -280 0 1 {name=p4 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -1130 -280 0 1 {name=p5 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -1670 -100 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1670 -40 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1210 -210 2 1 {name=p7 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -980 -230 2 0 {name=p8 sig_type=std_logic lab=RST
spice_ignore=true}
C {lab_pin.sym} -980 -200 2 0 {name=p9 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {code_shown.sym} -1740 -700 0 0 {name=s1 only_toplevel=false 
value="
.options temp = 27
.param VDD = 3.3
.param I_Bais = 1u
.include Tran_TB.save
.save all
.control
	tran 5u 9m

meas tran T_H when F_RST = 0.4 rise=1
meas tran VTH_H(V) FIND VCORE AT=T_H

meas tran T_L when F_RST = 0.8 fall=1
meas tran VTH_L(V) FIND VCORE AT=T_L

meas tran T1 when F_RST = 0.4 rise=1
meas tran T2 when RST = 0.4 rise=1
let Delay(mS) = (T2-T1)*1000

meas tran IQ FIND i(vmeas) AT=10m

let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000
print Hes


print VTH_H(V)
print VTH_L(V)
print Hes(mV)
print Delay(mS)

write Tran_TB.raw
.endc
"
}
C {vsource.sym} -1110 -740 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1110 -790 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {gnd.sym} -1110 -690 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1070 -140 0 1 {name=p10 sig_type=std_logic lab=VSS
spice_ignore=true}
C {vsource.sym} -1580 -60 0 0 {name=Vin4 value="pwl(0 0 10m 1.2 20m 1.2 20.1m 0.9 20.2m 1.2 30m 1.2 40m 0.7 50m 0.7 50.1m 1.2 55m 1.2 55.1m 0.7 60m 0.7 61m 0 70m 0 70.1m 1.2 70.2m 0 80m 0 100m 1)"
savecurrent=false
spice_ignore=true}
C {devices/launcher.sym} -1320 -920 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/Tran_TB.raw tran"
}
C {launcher.sym} -1320 -870 0 0 {name=h2
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# run netlist and simulation
xschem netlist
simulate
"}
C {vsource.sym} -1670 -70 0 0 {name=Vin1 value="pulse(0 1.2 1m 2m 2m 3m 8m)"
savecurrent=false
}
C {ammeter.sym} -1060 -450 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {simulator_commands_shown.sym} -1750 -1010 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      }
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -1040 -180 0 0 {name=x1
spice_ignore=true}
C {lab_pin.sym} -940 -960 0 0 {name=p11 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -940 -1060 0 0 {name=p12 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -940 -1000 2 1 {name=p13 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -940 -980 0 0 {name=p15 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -940 -1040 2 1 {name=p16 sig_type=std_logic lab=RST
}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -920 -1070 0 0 {name=X2
}
C {lab_pin.sym} -940 -1020 2 1 {name=p17 sig_type=std_logic lab=F_RST
}
C {lab_pin.sym} -1180 -610 2 0 {name=p18 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1160 -510 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1080 -510 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -1060 -420 0 1 {name=p2 sig_type=std_logic lab=I_Bais
}
C {gnd.sym} -1180 -370 0 0 {name=l5 lab=GND}
