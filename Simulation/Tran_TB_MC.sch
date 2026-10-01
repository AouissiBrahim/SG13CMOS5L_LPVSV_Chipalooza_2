v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -610 -690 0 0 0.3 0.3 {layer=11}
N -1280 -860 -1280 -840 {lab=VDD}
N -1280 -780 -1280 -760 {lab=0}
N -1190 -860 -1190 -840 {lab=VSS}
N -1190 -780 -1190 -760 {lab=0}
N -1040 -630 -1040 -570 {lab=VDD}
N -1000 -570 -960 -570 {lab=#net1}
N -920 -630 -920 -570 {lab=VDD}
N -1040 -630 -920 -630 {lab=VDD}
N -1040 -670 -1040 -630 {lab=VDD}
N -1040 -530 -1040 -510 {lab=#net1}
N -1040 -450 -1040 -430 {lab=GND}
N -1000 -570 -1000 -530 {lab=#net1}
N -1040 -530 -1000 -530 {lab=#net1}
N -1040 -540 -1040 -530 {lab=#net1}
C {vsource.sym} -1280 -810 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} -1280 -860 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -1280 -760 0 0 {name=l2 lab=0}
C {lab_pin.sym} -900 -300 0 1 {name=p4 sig_type=std_logic lab=I_Bais
}
C {lab_pin.sym} -970 -300 0 1 {name=p5 sig_type=std_logic lab=VDD
}
C {vsource.sym} -1080 -770 0 0 {name=V2 value="pulse(0 1.2 0.1m 1m 1m 4m 6.1m)" savecurrent=false
}
C {lab_pin.sym} -1080 -860 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1080 -740 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1050 -230 0 0 {name=p7 sig_type=std_logic lab=VCORE
}
C {lab_pin.sym} -820 -250 2 0 {name=p8 sig_type=std_logic lab=RST
}
C {lab_pin.sym} -820 -220 2 0 {name=p9 sig_type=std_logic lab=F_RST
}
C {simulator_commands_shown.sym} -640 -790 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt_stat
.lib cornerMOShv.lib mos_tt_stat
.include sg13cmos5l_stdcell.spice
"
      }
C {launcher.sym} -560 -650 0 0 {name=h2
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
C {code_shown.sym} -620 -570 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=5

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
//.option method = gear
.include Tran_TB_MC.save
.save all
.control
	tran 5u 6.2m
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
C {ammeter.sym} -1080 -830 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {simulator_commands_shown.sym} -1680 -60 0 0 {
name=Libs_Ngspice2
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV_Pex.gds.spice
"
      spice_ignore=true}
C {vsource.sym} -1190 -810 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1190 -860 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {gnd.sym} -1190 -760 0 0 {name=l1 lab=0}
C {lab_pin.sym} -910 -160 0 1 {name=p14 sig_type=std_logic lab=VSS
}
C {lab_pin.sym} -860 30 0 0 {name=p11 sig_type=std_logic lab=VSS
spice_ignore=true}
C {lab_pin.sym} -860 -70 0 0 {name=p12 sig_type=std_logic lab=VDD
spice_ignore=true}
C {lab_pin.sym} -860 -10 2 1 {name=p13 sig_type=std_logic lab=VCORE
spice_ignore=true}
C {lab_pin.sym} -860 10 0 0 {name=p15 sig_type=std_logic lab=I_Bais
spice_ignore=true}
C {lab_pin.sym} -860 -50 2 1 {name=p16 sig_type=std_logic lab=RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/Layout/LPVSV.sym} -840 -80 0 0 {name=X2
spice_ignore=true}
C {lab_pin.sym} -860 -30 2 1 {name=p17 sig_type=std_logic lab=F_RST
spice_ignore=true}
C {/foss/designs/LPVSV_Chipalooza_2/xschem/LPVSV.sym} -880 -200 0 0 {name=x1
}
C {isource.sym} -1040 -480 0 1 {name=I0 value=1u}
C {ammeter.sym} -920 -510 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1040 -670 2 0 {name=p18 sig_type=std_logic lab=VDD}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -1020 -570 0 1 {name=M1
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} -940 -570 0 0 {name=M2
l=2u
w=1u
 ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -920 -480 0 1 {name=p2 sig_type=std_logic lab=I_Bais
}
C {gnd.sym} -1040 -430 0 0 {name=l5 lab=GND}
