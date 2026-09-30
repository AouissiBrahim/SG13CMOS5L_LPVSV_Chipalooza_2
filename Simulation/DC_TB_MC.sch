v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -1470 -220 0 0 0.3 0.3 {layer=11}
N -870 -650 -870 -620 {lab=VCORE}
N -950 -650 -950 -620 {lab=VDD}
N -1050 -650 -1050 -620 {lab=VSS}
N -690 -610 -690 -550 {lab=VDD}
N -650 -550 -610 -550 {lab=#net1}
N -570 -610 -570 -550 {lab=VDD}
N -690 -610 -570 -610 {lab=VDD}
N -690 -650 -690 -610 {lab=VDD}
N -690 -510 -690 -490 {lab=#net1}
N -690 -430 -690 -410 {lab=GND}
N -650 -550 -650 -510 {lab=#net1}
N -690 -510 -650 -510 {lab=#net1}
N -690 -520 -690 -510 {lab=#net1}
C {code_shown.sym} -1830 -549.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.include DC_TB.save
.save all
.control

dc Vin 1.3 0 -0.01
	plot i(vmeas)
	meas dc VL when RST =0.2
	meas dc IQL max i(vss)
dc Vin 0 1.3 0.01
	meas dc VH when RST =0.95
	meas dc IQH max i(vss)

let Hes(mV) = (dc2.VH-dc1.VL)*1000
let VTH_L = dc1.VL
let VTH_H = dc2.VH
let IQ_Max(uA) = dc2.IQH*1e6

echo results_save_begin
print VTH_H 
print VTH_L
print Hes(mV)
print IQ_Max(uA)
echo results_save_end
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
C {lab_pin.sym} -820 -320 0 1 {name=p7 sig_type=std_logic lab=Rst
}
C {code.sym} -1360 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -970 -370 1 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1050 -300 0 0 {name=p2 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -900 -370 1 0 {name=p3 sig_type=std_logic lab=I_Bais
}
C {vsource.sym} -1050 -590 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1050 -650 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -910 -230 3 0 {name=p5 sig_type=std_logic lab=VSS
}
C {vsource.sym} -870 -590 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -820 -290 0 1 {name=p6 sig_type=std_logic lab=F_Rst
}
C {simulator_commands_shown.sym} -1820 -660 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt_stat
.lib cornerMOShv.lib mos_tt_stat
.include sg13cmos5l_stdcell.spice
"
      }
C {launcher.sym} -1420 -175 0 0 {name=h2
descr=SimulatePARALLEL
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

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
python3 $\{PDK_ROOT\}/$\{PDK\}/libs.tech/xschem/sg13g2_tests/ngspice_parallel_mc.py [file tail [xschem get current_name]]
"}
C {code_shown.sym} -1440 -460 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=10

**results_plot_begin
**VTH_H 
**VTH_L
**Hes(mV)
**IQ_Max(uA)
**results_plot_end
"
}
C {simulator_commands_shown.sym} -1820 -30 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -880 -270 0 0 {name=x1
}
C {lab_pin.sym} -1040 -10 0 0 {name=p8 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -1040 -110 0 0 {name=p10 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -1040 -50 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -1040 -30 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -1040 -90 2 1 {name=p14 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -1020 -120 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -1040 -70 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {isource.sym} -690 -460 0 0 {name=I0 value=1u}
C {lab_pin.sym} -690 -650 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -670 -550 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -590 -550 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} -690 -410 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -570 -520 3 0 {name=p18 sig_type=std_logic lab=I_Bais
}
