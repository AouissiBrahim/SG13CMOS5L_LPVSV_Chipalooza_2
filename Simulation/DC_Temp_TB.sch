v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -1310 -690 -510 -290 {flags=graph
y1=-0.19
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.3
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="4 7"
node="RST
VCORE"}
N -950 -210 -950 -180 {lab=VCORE}
N -1030 -210 -1030 -180 {lab=VDD}
N -1130 -210 -1130 -180 {lab=VSS}
N -590 -150 -540 -150 {lab=Rst
spice_ignore=true}
N -590 -120 -540 -120 {lab=F_Rst
spice_ignore=true}
N -1450 -190 -1450 -130 {lab=VDD}
N -1410 -130 -1370 -130 {lab=#net1}
N -1330 -190 -1330 -130 {lab=VDD}
N -1450 -190 -1330 -190 {lab=VDD}
N -1450 -230 -1450 -190 {lab=VDD}
N -1450 -90 -1450 -70 {lab=#net1}
N -1450 -10 -1450 10 {lab=GND}
N -1410 -130 -1410 -90 {lab=#net1}
N -1450 -90 -1410 -90 {lab=#net1}
N -1450 -100 -1450 -90 {lab=#net1}
C {code_shown.sym} -1970 -469.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.include DC_Temp_TB.save
.save all
.control

dc Vin 0 1.3 0.01 temp -40 125 15
	plot vcore rst
write DC_Temp_TB.raw

.endc
"
}
C {lab_pin.sym} -950 -210 0 1 {name=p11 sig_type=std_logic lab=VCORE}
C {gnd.sym} -950 -120 0 0 {name=l9 lab=GND}
C {vsource.sym} -1030 -150 0 0 {name=VDD value=3.3
savecurrent=false
}
C {lab_pin.sym} -1030 -210 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {gnd.sym} -1030 -120 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -540 -150 0 1 {name=p7 sig_type=std_logic lab=Rst
spice_ignore=true}
C {code.sym} -1970 -260 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -740 -200 1 0 {name=p1 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -820 -130 0 0 {name=p2 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {vsource.sym} -1130 -150 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1130 -210 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1130 -120 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -680 -60 3 0 {name=p5 sig_type=std_logic lab=VSS
spice_ignore=true}
C {vsource.sym} -950 -150 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -540 -120 0 1 {name=p6 sig_type=std_logic lab=F_Rst
spice_ignore=true}
C {simulator_commands_shown.sym} -1960 -640 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.include sg13cmos5l_stdcell.spice
"
      }
C {launcher.sym} -1900 -70 0 0 {name=h2
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
C {devices/launcher.sym} -1900 -30 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/DC_Temp_TB.raw dc"
}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -650 -100 0 0 {name=x2
spice_ignore=true}
C {lab_pin.sym} -680 130 0 0 {name=p8 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -680 30 0 0 {name=p10 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -680 90 2 1 {name=p13 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -680 110 0 0 {name=p15 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -680 50 2 1 {name=p14 sig_type=std_logic lab=RST
}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -660 20 0 0 {name=X1
}
C {lab_pin.sym} -680 70 2 1 {name=p17 sig_type=std_logic lab=F_RST
}
C {simulator_commands_shown.sym} -1960 140 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      }
C {lab_pin.sym} -670 -200 1 0 {name=p3 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {isource.sym} -1450 -40 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1450 -230 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1430 -130 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1350 -130 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} -1450 10 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -1330 -100 3 0 {name=p18 sig_type=std_logic lab=I_Bais
}
