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
N -1170 -650 -1170 -580 {lab=VDD}
C {code_shown.sym} -1830 -549.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.include DC_TB.save
.save all
.control

dc Vin 1.3 0 -0.01
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
C {lab_pin.sym} -880 -380 0 1 {name=p7 sig_type=std_logic lab=Rst
spice_ignore=true}
C {code.sym} -1360 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -1030 -430 1 0 {name=p1 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -1110 -360 0 0 {name=p2 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -960 -430 1 0 {name=p3 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {vsource.sym} -1050 -590 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1050 -650 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -970 -290 3 0 {name=p5 sig_type=std_logic lab=VSS
spice_ignore=true}
C {vsource.sym} -870 -590 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -880 -350 0 1 {name=p6 sig_type=std_logic lab=F_Rst
spice_ignore=true}
C {isource.sym} -1170 -550 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1170 -650 2 0 {name=p12 sig_type=std_logic lab=VDD}
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
C {lab_pin.sym} -1170 -520 3 0 {name=p9 sig_type=std_logic lab=I_Bais}
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
**nr_mc_sims=1000

**results_plot_begin
**VTH_H 
**VTH_L
**Hes(mV)
**IQ_Max(uA)
**results_plot_end
"
}
C {lab_pin.sym} -1010 -20 0 0 {name=p8 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -1010 -140 0 0 {name=p10 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1010 -100 2 1 {name=p13 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -1010 -120 0 0 {name=p15 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -1010 -40 2 1 {name=p14 sig_type=std_logic lab=RST
}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.sym} -990 -150 0 0 {name=X2
}
C {lab_pin.sym} -1010 -60 2 1 {name=p17 sig_type=std_logic lab=F_RST
}
C {lab_pin.sym} -1010 -80 2 1 {name=p18 sig_type=std_logic lab=VTH
}
C {simulator_commands_shown.sym} -1820 -30 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      }
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -940 -330 0 0 {name=x1
spice_ignore=true}
