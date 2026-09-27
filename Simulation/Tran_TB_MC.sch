v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -890 -650 0 0 0.3 0.3 {layer=11}
N -1280 -860 -1280 -840 {lab=VDD}
N -1280 -780 -1280 -760 {lab=0}
N -1120 -860 -1120 -840 {lab=VDD}
N -990 -860 -990 -840 {lab=VSS}
N -990 -780 -990 -760 {lab=0}
N -1120 -780 -1120 -760 {lab=#net1}
C {vsource.sym} -1280 -810 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} -1280 -860 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -1280 -760 0 0 {name=l2 lab=0}
C {lab_pin.sym} -1120 -400 0 1 {name=p4 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -1190 -400 0 1 {name=p5 sig_type=std_logic lab=VDD
spice_ignore=true}
C {vsource.sym} -1230 -570 0 0 {name=V2 value="pulse(0 1.2 0.1m 1m 1m 3m 5.1m)" savecurrent=false
}
C {lab_pin.sym} -1230 -660 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1230 -540 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1270 -330 0 0 {name=p7 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {ammeter.sym} -1100 -260 3 1 {name=Vmeas savecurrent=true spice_ignore=true}
C {lab_pin.sym} -1040 -350 2 0 {name=p8 sig_type=std_logic lab=RST
spice_ignore=true}
C {lab_pin.sym} -1040 -320 2 0 {name=p9 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {simulator_commands_shown.sym} -920 -750 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt_stat
.lib cornerMOShv.lib mos_tt_stat
.include sg13cmos5l_stdcell.spice
"
      }
C {launcher.sym} -840 -610 0 0 {name=h2
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
C {code_shown.sym} -900 -530 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=100

**results_plot_begin
**VTH_H(V)
**VTH_L(V)
**Hes(mV)
**Delay(mS)
**results_plot_end
"
}
C {code_shown.sym} -1690 -840 0 0 {name=s1 only_toplevel=false 
value="
.include Tran_TB_MC.save
.save all
.control
	tran 2u 5.2m
	plot rst vcore
meas tran T_L when F_RST = 0.8 fall=1
meas tran VTH_L(V) FIND VCORE AT=T_L

meas tran T_L2 when RST = 0.8 fall=1
meas tran VTH_L2(V) FIND VCORE AT=T_L

meas tran T_H when F_RST = 0.4 rise=1
meas tran VTH_H(V) FIND VCORE AT=T_H

meas tran T1 when F_RST = 0.4 rise=1
meas tran T2 when RST = 0.4 rise=1
let Delay(mS) = (T2-T1)*1000

meas tran IQ FIND i(vmeas) AT=10m


let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000
print Hes

write Tran_TB_MC.raw

echo results_save_begin
print VTH_H(V)
print VTH_L(V)
print Hes(mV)
print Delay(mS)
echo results_save_end

.endc
"
}
C {isource.sym} -1120 -810 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1120 -860 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1120 -700 0 0 {name=p3 sig_type=std_logic lab=I_Bais}
C {ammeter.sym} -1120 -730 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -1230 -630 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {simulator_commands_shown.sym} -1670 -100 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      }
C {vsource.sym} -990 -810 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -990 -860 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {gnd.sym} -990 -760 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1070 -260 0 1 {name=p14 sig_type=std_logic lab=VSS
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -1100 -300 0 0 {name=x1
spice_ignore=true}
C {lab_pin.sym} -910 -80 0 0 {name=p11 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -910 -180 0 0 {name=p12 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -910 -120 2 1 {name=p13 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -910 -100 0 0 {name=p15 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -910 -160 2 1 {name=p16 sig_type=std_logic lab=RST
}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -890 -190 0 0 {name=X2
}
C {lab_pin.sym} -910 -140 2 1 {name=p17 sig_type=std_logic lab=F_RST
}
