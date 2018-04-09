
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART digilentinc.com:zedboard:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set CONFIG_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 CONFIG_AXI ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {15} \
CONFIG.ARUSER_WIDTH {0} \
CONFIG.AWUSER_WIDTH {0} \
CONFIG.BUSER_WIDTH {0} \
CONFIG.DATA_WIDTH {32} \
CONFIG.FREQ_HZ {100000000} \
CONFIG.HAS_BRESP {1} \
CONFIG.HAS_BURST {0} \
CONFIG.HAS_CACHE {0} \
CONFIG.HAS_LOCK {0} \
CONFIG.HAS_PROT {1} \
CONFIG.HAS_QOS {0} \
CONFIG.HAS_REGION {0} \
CONFIG.HAS_RRESP {1} \
CONFIG.HAS_WSTRB {1} \
CONFIG.ID_WIDTH {0} \
CONFIG.MAX_BURST_LENGTH {1} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_READ_THREADS {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.NUM_WRITE_THREADS {1} \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.READ_WRITE_MODE {READ_WRITE} \
CONFIG.RUSER_BITS_PER_BYTE {0} \
CONFIG.RUSER_WIDTH {0} \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.WUSER_BITS_PER_BYTE {0} \
CONFIG.WUSER_WIDTH {0} \
 ] $CONFIG_AXI
  set DATA_IN_AXIS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 DATA_IN_AXIS ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {1} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {1} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $DATA_IN_AXIS
  set M00_AXIS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M00_AXIS ]

  # Create ports
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
 ] $CLK
  set ERROR [ create_bd_port -dir O -from 8 -to 0 -type data ERROR ]
  set RST [ create_bd_port -dir I RST ]
  set STATUS [ create_bd_port -dir O -from 3 -to 0 -type data STATUS ]

  # Create instance: Cyclic_Prefix_0, and set properties
  set Cyclic_Prefix_0 [ create_bd_cell -type ip -vlnv user.org:user:Cyclic_Prefix:0.1 Cyclic_Prefix_0 ]

  # Create instance: FFT_Controller_0, and set properties
  set FFT_Controller_0 [ create_bd_cell -type ip -vlnv user.org:user:FFT_Controller:0.1 FFT_Controller_0 ]

  # Create instance: axi_interconnect, and set properties
  set axi_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect ]
  set_property -dict [ list \
CONFIG.NUM_MI {5} \
 ] $axi_interconnect

  # Create instance: error_bus, and set properties
  set error_bus [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 error_bus ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {9} \
 ] $error_bus

  # Create instance: ifft, and set properties
  set ifft [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.0 ifft ]
  set_property -dict [ list \
CONFIG.aresetn {true} \
CONFIG.memory_options_data {block_ram} \
CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {0} \
CONFIG.run_time_configurable_transform_length {true} \
 ] $ifft

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors.VALUE_SRC {DEFAULT} \
 ] $ifft

  # Create instance: pilot_insertion, and set properties
  set pilot_insertion [ create_bd_cell -type ip -vlnv user.org:user:Pilot_Insertion:0.1 pilot_insertion ]

  # Create instance: preamble, and set properties
  set preamble [ create_bd_cell -type ip -vlnv user.org:user:Preamble:0.1 preamble ]

  # Create instance: qam_modulator, and set properties
  set qam_modulator [ create_bd_cell -type ip -vlnv user.org:user:QAM_Modulator:0.1 qam_modulator ]

  # Create instance: status_bus, and set properties
  set status_bus [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 status_bus ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $status_bus

  # Create interface connections
  connect_bd_intf_net -intf_net Cyclic_Prefix_0_M00_AXIS [get_bd_intf_ports M00_AXIS] [get_bd_intf_pins Cyclic_Prefix_0/M00_AXIS]
  connect_bd_intf_net -intf_net FFT_Controller_0_M00_AXIS [get_bd_intf_pins FFT_Controller_0/M00_AXIS] [get_bd_intf_pins ifft/S_AXIS_CONFIG]
  connect_bd_intf_net -intf_net Pilot_Insertion_0_M00_AXIS [get_bd_intf_pins ifft/S_AXIS_DATA] [get_bd_intf_pins pilot_insertion/M00_AXIS]
  connect_bd_intf_net -intf_net Preamble_0_M00_AXIS [get_bd_intf_pins pilot_insertion/S00_AXIS] [get_bd_intf_pins preamble/M00_AXIS]
  connect_bd_intf_net -intf_net S00_AXIS_1 [get_bd_intf_ports DATA_IN_AXIS] [get_bd_intf_pins qam_modulator/S00_AXIS]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_ports CONFIG_AXI] [get_bd_intf_pins axi_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect/M00_AXI] [get_bd_intf_pins qam_modulator/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect/M01_AXI] [get_bd_intf_pins preamble/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_interconnect/M02_AXI] [get_bd_intf_pins pilot_insertion/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_M03_AXI [get_bd_intf_pins FFT_Controller_0/S00_AXI] [get_bd_intf_pins axi_interconnect/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_M04_AXI [get_bd_intf_pins Cyclic_Prefix_0/S00_AXI] [get_bd_intf_pins axi_interconnect/M04_AXI]
  connect_bd_intf_net -intf_net ifft_M_AXIS_DATA [get_bd_intf_pins Cyclic_Prefix_0/S00_AXIS] [get_bd_intf_pins ifft/M_AXIS_DATA]
  connect_bd_intf_net -intf_net qam_modulator_M00_AXIS [get_bd_intf_pins preamble/S00_AXIS] [get_bd_intf_pins qam_modulator/M00_AXIS]

  # Create port connections
  connect_bd_net -net Cyclic_Prefix_0_cp_flag [get_bd_pins Cyclic_Prefix_0/cp_flag] [get_bd_pins status_bus/In3]
  connect_bd_net -net Cyclic_Prefix_0_error [get_bd_pins Cyclic_Prefix_0/error] [get_bd_pins error_bus/In8]
  connect_bd_net -net Net1 [get_bd_ports RST] [get_bd_pins Cyclic_Prefix_0/m00_axis_aresetn] [get_bd_pins Cyclic_Prefix_0/s00_axi_aresetn] [get_bd_pins Cyclic_Prefix_0/s00_axis_aresetn] [get_bd_pins FFT_Controller_0/m00_axis_aresetn] [get_bd_pins FFT_Controller_0/s00_axi_aresetn] [get_bd_pins axi_interconnect/ARESETN] [get_bd_pins axi_interconnect/M00_ARESETN] [get_bd_pins axi_interconnect/M01_ARESETN] [get_bd_pins axi_interconnect/M02_ARESETN] [get_bd_pins axi_interconnect/M03_ARESETN] [get_bd_pins axi_interconnect/M04_ARESETN] [get_bd_pins axi_interconnect/S00_ARESETN] [get_bd_pins ifft/aresetn] [get_bd_pins pilot_insertion/m00_axis_aresetn] [get_bd_pins pilot_insertion/s00_axi_aresetn] [get_bd_pins pilot_insertion/s00_axis_aresetn] [get_bd_pins preamble/m00_axis_aresetn] [get_bd_pins preamble/s00_axi_aresetn] [get_bd_pins preamble/s00_axis_aresetn] [get_bd_pins qam_modulator/m00_axis_aresetn] [get_bd_pins qam_modulator/s00_axi_aresetn] [get_bd_pins qam_modulator/s00_axis_aresetn]
  connect_bd_net -net Preamble_0_error [get_bd_pins error_bus/In1] [get_bd_pins preamble/error]
  connect_bd_net -net QAM_Modulator_0_error [get_bd_pins error_bus/In0] [get_bd_pins qam_modulator/error]
  connect_bd_net -net error_bus_dout [get_bd_ports ERROR] [get_bd_pins error_bus/dout]
  connect_bd_net -net ifft_event_frame_started [get_bd_pins ifft/event_frame_started] [get_bd_pins status_bus/In2]
  connect_bd_net -net pilot_insertion_error [get_bd_pins error_bus/In2] [get_bd_pins pilot_insertion/error]
  connect_bd_net -net pilot_insertion_pilot_flag [get_bd_pins pilot_insertion/pilot_flag] [get_bd_pins status_bus/In1]
  connect_bd_net -net preamble_preamble_flag [get_bd_pins preamble/preamble_flag] [get_bd_pins status_bus/In0]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports CLK] [get_bd_pins Cyclic_Prefix_0/m00_axis_aclk] [get_bd_pins Cyclic_Prefix_0/s00_axi_aclk] [get_bd_pins Cyclic_Prefix_0/s00_axis_aclk] [get_bd_pins FFT_Controller_0/m00_axis_aclk] [get_bd_pins FFT_Controller_0/s00_axi_aclk] [get_bd_pins axi_interconnect/ACLK] [get_bd_pins axi_interconnect/M00_ACLK] [get_bd_pins axi_interconnect/M01_ACLK] [get_bd_pins axi_interconnect/M02_ACLK] [get_bd_pins axi_interconnect/M03_ACLK] [get_bd_pins axi_interconnect/M04_ACLK] [get_bd_pins axi_interconnect/S00_ACLK] [get_bd_pins ifft/aclk] [get_bd_pins pilot_insertion/m00_axis_aclk] [get_bd_pins pilot_insertion/s00_axi_aclk] [get_bd_pins pilot_insertion/s00_axis_aclk] [get_bd_pins preamble/m00_axis_aclk] [get_bd_pins preamble/s00_axi_aclk] [get_bd_pins preamble/s00_axis_aclk] [get_bd_pins qam_modulator/m00_axis_aclk] [get_bd_pins qam_modulator/s00_axi_aclk] [get_bd_pins qam_modulator/s00_axis_aclk]
  connect_bd_net -net status_bus_dout [get_bd_ports STATUS] [get_bd_pins status_bus/dout]
  connect_bd_net -net xfft_0_event_data_in_channel_halt [get_bd_pins error_bus/In6] [get_bd_pins ifft/event_data_in_channel_halt]
  connect_bd_net -net xfft_0_event_data_out_channel_halt [get_bd_pins error_bus/In7] [get_bd_pins ifft/event_data_out_channel_halt]
  connect_bd_net -net xfft_0_event_status_channel_halt [get_bd_pins error_bus/In5] [get_bd_pins ifft/event_status_channel_halt]
  connect_bd_net -net xfft_0_event_tlast_missing [get_bd_pins error_bus/In4] [get_bd_pins ifft/event_tlast_missing]
  connect_bd_net -net xfft_0_event_tlast_unexpected [get_bd_pins error_bus/In3] [get_bd_pins ifft/event_tlast_unexpected]

  # Create address segments
  create_bd_addr_seg -range 0x00001000 -offset 0x00001000 [get_bd_addr_spaces CONFIG_AXI] [get_bd_addr_segs Cyclic_Prefix_0/S00_AXI/S00_AXI_reg] SEG_Cyclic_Prefix_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00000000 [get_bd_addr_spaces CONFIG_AXI] [get_bd_addr_segs FFT_Controller_0/S00_AXI/S00_AXI_reg] SEG_FFT_Controller_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00002000 [get_bd_addr_spaces CONFIG_AXI] [get_bd_addr_segs pilot_insertion/S00_AXI/S00_AXI_reg] SEG_pilot_insertion_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00003000 [get_bd_addr_spaces CONFIG_AXI] [get_bd_addr_segs preamble/S00_AXI/S00_AXI_reg] SEG_preamble_S00_AXI_reg
  create_bd_addr_seg -range 0x00001000 -offset 0x00004000 [get_bd_addr_spaces CONFIG_AXI] [get_bd_addr_segs qam_modulator/S00_AXI/S00_AXI_reg] SEG_qam_modulator_S00_AXI_reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port RST -pg 1 -y 240 -defaultsOSRD
preplace port CLK -pg 1 -y 220 -defaultsOSRD
preplace port M00_AXIS -pg 1 -y 400 -defaultsOSRD
preplace port CONFIG_AXI -pg 1 -y 200 -defaultsOSRD
preplace port DATA_IN_AXIS -pg 1 -y 120 -defaultsOSRD
preplace portBus STATUS -pg 1 -y 300 -defaultsOSRD
preplace portBus ERROR -pg 1 -y 560 -defaultsOSRD
preplace inst preamble -pg 1 -lvl 3 -y 120 -defaultsOSRD
preplace inst pilot_insertion -pg 1 -lvl 4 -y 250 -defaultsOSRD
preplace inst status_bus -pg 1 -lvl 7 -y 300 -defaultsOSRD
preplace inst axi_interconnect -pg 1 -lvl 1 -y 340 -defaultsOSRD
preplace inst qam_modulator -pg 1 -lvl 2 -y 170 -defaultsOSRD
preplace inst FFT_Controller_0 -pg 1 -lvl 4 -y 480 -defaultsOSRD
preplace inst error_bus -pg 1 -lvl 7 -y 560 -defaultsOSRD
preplace inst Cyclic_Prefix_0 -pg 1 -lvl 6 -y 420 -defaultsOSRD
preplace inst ifft -pg 1 -lvl 5 -y 540 -defaultsOSRD
preplace netloc Cyclic_Prefix_0_M00_AXIS 1 6 2 NJ 400 NJ
preplace netloc S00_AXIS_1 1 0 2 NJ 120 NJ
preplace netloc qam_modulator_M00_AXIS 1 2 1 850
preplace netloc Cyclic_Prefix_0_cp_flag 1 6 1 2310
preplace netloc ifft_event_frame_started 1 5 2 1970 300 2330J
preplace netloc xfft_0_event_tlast_unexpected 1 5 2 1980 540 NJ
preplace netloc status_bus_dout 1 7 1 NJ
preplace netloc xfft_0_event_data_out_channel_halt 1 5 2 N 600 2290J
preplace netloc Pilot_Insertion_0_M00_AXIS 1 4 1 1520
preplace netloc Preamble_0_error 1 3 4 NJ 120 NJ 120 NJ 120 2350J
preplace netloc QAM_Modulator_0_error 1 2 5 850J 370 NJ 370 NJ 370 1950J 290 2340J
preplace netloc axi_interconnect_M04_AXI 1 1 5 NJ 380 NJ 380 NJ 380 NJ 380 1960
preplace netloc axi_interconnect_0_M02_AXI 1 1 3 NJ 340 NJ 340 1150
preplace netloc error_bus_dout 1 7 1 NJ
preplace netloc preamble_preamble_flag 1 3 4 1150J 130 NJ 130 NJ 130 2370J
preplace netloc xfft_0_event_data_in_channel_halt 1 5 2 N 580 2300J
preplace netloc ifft_M_AXIS_DATA 1 5 1 1980
preplace netloc pilot_insertion_pilot_flag 1 4 3 N 250 NJ 250 2360J
preplace netloc S00_AXI_1 1 0 1 NJ
preplace netloc xfft_0_event_status_channel_halt 1 5 2 1950 570 2340J
preplace netloc xfft_0_event_tlast_missing 1 5 2 1960 560 NJ
preplace netloc FFT_Controller_0_M00_AXIS 1 4 1 1510
preplace netloc axi_interconnect_0_M00_AXI 1 1 1 560
preplace netloc axi_interconnect_0_M01_AXI 1 1 2 NJ 320 840J
preplace netloc Net1 1 0 6 20 570 580 570 870 570 1170 570 1510 650 2000
preplace netloc processing_system7_0_FCLK_CLK0 1 0 6 30 660 570 660 860 660 1160 660 1520 660 1990
preplace netloc pilot_insertion_error 1 4 3 NJ 270 NJ 270 2320J
preplace netloc Cyclic_Prefix_0_error 1 6 1 2310
preplace netloc axi_interconnect_M03_AXI 1 1 3 NJ 360 NJ 360 1150
preplace netloc Preamble_0_M00_AXIS 1 3 1 1170
levelinfo -pg 1 0 420 710 1010 1360 1770 2160 2460 2570 -top -430 -bot 730
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


