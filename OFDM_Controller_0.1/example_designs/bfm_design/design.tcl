proc create_ipi_design { offsetfile design_name } {
	create_bd_design $design_name
	open_bd_design $design_name

	# Create Clock and Reset Ports
	set ACLK [ create_bd_port -dir I -type clk ACLK ]
	set_property -dict [ list CONFIG.FREQ_HZ {100000000} CONFIG.PHASE {0.000} CONFIG.CLK_DOMAIN "${design_name}_ACLK" ] $ACLK
	set ARESETN [ create_bd_port -dir I -type rst ARESETN ]
	set_property -dict [ list CONFIG.POLARITY {ACTIVE_LOW}  ] $ARESETN
	set_property CONFIG.ASSOCIATED_RESET ARESETN $ACLK

	# Create instance: OFDM_Controller_0, and set properties
	set OFDM_Controller_0 [ create_bd_cell -type ip -vlnv user.org:user:OFDM_Controller:0.1 OFDM_Controller_0]

	# Create External ports
	set M00_AXI_INIT_AXI_TXN [ create_bd_port -dir I M00_AXI_INIT_AXI_TXN ]
	set M00_AXI_ERROR [ create_bd_port -dir O M00_AXI_ERROR ]
	set M00_AXI_TXN_DONE [ create_bd_port -dir O M00_AXI_TXN_DONE ]

	# Create instance: slave_0, and set properties
	set slave_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm slave_0]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {2} CONFIG.C_MODE_SELECT {1} CONFIG.C_S_AXI4_LITE_HIGHADDR {0x4000FFFF} CONFIG.C_S_AXI4_BASEADDR {0x40000000} CONFIG.C_S_AXI4_LITE_MEMORY_MODEL_MODE {1} ] $slave_0

connect_bd_intf_net [get_bd_intf_pins slave_0/S_AXI_LITE] [get_bd_intf_pins OFDM_Controller_0/M00_AXI]
	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins slave_0/S_AXI_LITE_ACLK] [get_bd_pins OFDM_Controller_0/M00_AXI_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins slave_0/S_AXI_LITE_ARESETN] [get_bd_pins OFDM_Controller_0/M00_AXI_ARESETN]
	connect_bd_net -net init_axi_txn_00 [get_bd_ports M00_AXI_INIT_AXI_TXN] [get_bd_pins OFDM_Controller_0/M00_AXI_INIT_AXI_TXN]
	connect_bd_net -net error_00 [get_bd_ports M00_AXI_ERROR] [get_bd_pins OFDM_Controller_0/M00_AXI_ERROR]
	connect_bd_net -net txn_done_00 [get_bd_ports M00_AXI_TXN_DONE] [get_bd_pins OFDM_Controller_0/M00_AXI_TXN_DONE]

	# Create External ports
	set M01_AXI_INIT_AXI_TXN [ create_bd_port -dir I M01_AXI_INIT_AXI_TXN ]
	set M01_AXI_ERROR [ create_bd_port -dir O M01_AXI_ERROR ]
	set M01_AXI_TXN_DONE [ create_bd_port -dir O M01_AXI_TXN_DONE ]

	# Create instance: slave_1, and set properties
	set slave_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm slave_1]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {2} CONFIG.C_MODE_SELECT {1} CONFIG.C_S_AXI4_LITE_HIGHADDR {0x4000FFFF} CONFIG.C_S_AXI4_BASEADDR {0x40000000} CONFIG.C_S_AXI4_LITE_MEMORY_MODEL_MODE {1} ] $slave_1

connect_bd_intf_net [get_bd_intf_pins slave_1/S_AXI_LITE] [get_bd_intf_pins OFDM_Controller_0/M01_AXI]
	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins slave_1/S_AXI_LITE_ACLK] [get_bd_pins OFDM_Controller_0/M01_AXI_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins slave_1/S_AXI_LITE_ARESETN] [get_bd_pins OFDM_Controller_0/M01_AXI_ARESETN]
	connect_bd_net -net init_axi_txn_11 [get_bd_ports M01_AXI_INIT_AXI_TXN] [get_bd_pins OFDM_Controller_0/M01_AXI_INIT_AXI_TXN]
	connect_bd_net -net error_11 [get_bd_ports M01_AXI_ERROR] [get_bd_pins OFDM_Controller_0/M01_AXI_ERROR]
	connect_bd_net -net txn_done_11 [get_bd_ports M01_AXI_TXN_DONE] [get_bd_pins OFDM_Controller_0/M01_AXI_TXN_DONE]

	# Create External ports
	set M02_AXI_INIT_AXI_TXN [ create_bd_port -dir I M02_AXI_INIT_AXI_TXN ]
	set M02_AXI_ERROR [ create_bd_port -dir O M02_AXI_ERROR ]
	set M02_AXI_TXN_DONE [ create_bd_port -dir O M02_AXI_TXN_DONE ]

	# Create instance: slave_2, and set properties
	set slave_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm slave_2]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {2} CONFIG.C_MODE_SELECT {1} CONFIG.C_S_AXI4_LITE_HIGHADDR {0x4000FFFF} CONFIG.C_S_AXI4_BASEADDR {0x40000000} CONFIG.C_S_AXI4_LITE_MEMORY_MODEL_MODE {1} ] $slave_2

connect_bd_intf_net [get_bd_intf_pins slave_2/S_AXI_LITE] [get_bd_intf_pins OFDM_Controller_0/M02_AXI]
	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins slave_2/S_AXI_LITE_ACLK] [get_bd_pins OFDM_Controller_0/M02_AXI_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins slave_2/S_AXI_LITE_ARESETN] [get_bd_pins OFDM_Controller_0/M02_AXI_ARESETN]
	connect_bd_net -net init_axi_txn_22 [get_bd_ports M02_AXI_INIT_AXI_TXN] [get_bd_pins OFDM_Controller_0/M02_AXI_INIT_AXI_TXN]
	connect_bd_net -net error_22 [get_bd_ports M02_AXI_ERROR] [get_bd_pins OFDM_Controller_0/M02_AXI_ERROR]
	connect_bd_net -net txn_done_22 [get_bd_ports M02_AXI_TXN_DONE] [get_bd_pins OFDM_Controller_0/M02_AXI_TXN_DONE]

	# Create instance: slave_3, and set properties
	set slave_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm slave_3]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {3} CONFIG.C_MODE_SELECT {1} CONFIG.C_S_AXIS_TDATA_WIDTH {32} CONFIG.C_S_AXIS_STROBE_NOT_USED {1} CONFIG.C_S_AXIS_KEEP_NOT_USED {1}  ] $slave_3


	# Create interface connections
	connect_bd_intf_net -intf_net slave_3_s_axis [get_bd_intf_pins OFDM_Controller_0/M00_AXIS] [get_bd_intf_pins slave_3/S_AXIS]
	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins OFDM_Controller_0/M00_AXIS_ACLK] [get_bd_pins slave_3/S_AXIS_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins OFDM_Controller_0/M00_AXIS_ARESETN] [get_bd_pins slave_3/S_AXIS_ARESETN]

	# Create instance: master_0, and set properties
	set master_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm master_0]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {2} ] $master_0

	# Create interface connections
	connect_bd_intf_net [get_bd_intf_pins master_0/M_AXI_LITE] [get_bd_intf_pins OFDM_Controller_0/S00_AXI]

	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins master_0/M_AXI_LITE_ACLK] [get_bd_pins OFDM_Controller_0/S00_AXI_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins master_0/M_AXI_LITE_ARESETN] [get_bd_pins OFDM_Controller_0/S00_AXI_ARESETN]

	# Create instance: master_1, and set properties
	set master_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cdn_axi_bfm master_1]
	set_property -dict [ list CONFIG.C_PROTOCOL_SELECTION {2} ] $master_1

	# Create interface connections
	connect_bd_intf_net [get_bd_intf_pins master_1/M_AXI_LITE] [get_bd_intf_pins OFDM_Controller_0/S_AXI_INTR]

	# Create port connections
	connect_bd_net -net aclk_net [get_bd_ports ACLK] [get_bd_pins master_1/M_AXI_LITE_ACLK] [get_bd_pins OFDM_Controller_0/S_AXI_INTR_ACLK]
	connect_bd_net -net aresetn_net [get_bd_ports ARESETN] [get_bd_pins master_1/M_AXI_LITE_ARESETN] [get_bd_pins OFDM_Controller_0/S_AXI_INTR_ARESETN]
	set S_AXI_INTR_IRQ [ create_bd_port -dir O -type intr irq ]
	connect_bd_net [get_bd_pins /OFDM_Controller_0/irq] ${S_AXI_INTR_IRQ}

	# Auto assign address
	assign_bd_address

	# Copy all address to interface_address.vh file
	set bd_path [file dirname [get_property NAME [get_files ${design_name}.bd]]]
	upvar 1 $offsetfile offset_file
	set offset_file "${bd_path}/OFDM_Controller_v0_1_tb_include.vh"
	set fp [open $offset_file "w"]
	puts $fp "`ifndef OFDM_Controller_v0_1_tb_include_vh_"
	puts $fp "`define OFDM_Controller_v0_1_tb_include_vh_\n"
	puts $fp "//Configuration current bd names"
	puts $fp "`define BD_INST_NAME ${design_name}_i"
	puts $fp "`define BD_WRAPPER ${design_name}_wrapper\n"
	puts $fp "//Configuration address parameters"

	set offset [get_property OFFSET [get_bd_addr_segs -of_objects [get_bd_addr_spaces master_0/Data_lite]]]
	set offset_hex [string replace $offset 0 1 "32'h"]
	puts $fp "`define S00_AXI_SLAVE_ADDRESS ${offset_hex}"

	set offset [get_property OFFSET [get_bd_addr_segs -of_objects [get_bd_addr_spaces master_1/Data_lite]]]
	set offset_hex [string replace $offset 0 1 "32'h"]
	puts $fp "`define S_AXI_INTR_SLAVE_ADDRESS ${offset_hex}"

	puts $fp "\n//Interrupt configuration parameters"

	set param_irq_active_state [get_property CONFIG.C_IRQ_ACTIVE_STATE [get_bd_cells OFDM_Controller_0]]
	set param_irq_sensitivity [get_property CONFIG.C_IRQ_SENSITIVITY [get_bd_cells OFDM_Controller_0]]
	set param_intr_active_state [get_property CONFIG.C_INTR_ACTIVE_STATE [get_bd_cells OFDM_Controller_0]]
	set param_intr_sensitivity [get_property CONFIG.C_INTR_SENSITIVITY [get_bd_cells OFDM_Controller_0]]

	puts $fp "`define IRQ_ACTIVE_STATE ${param_irq_active_state}"
	puts $fp "`define IRQ_SENSITIVITY ${param_irq_sensitivity}"
	puts $fp "`define INTR_ACTIVE_STATE ${param_intr_active_state}"
	puts $fp "`define INTR_SENSITIVITY ${param_intr_sensitivity}\n"
	puts $fp "`endif"
	close $fp
}

set ip_path [file dirname [file normalize [get_property XML_FILE_NAME [ipx::get_cores user.org:user:OFDM_Controller:0.1]]]]
set test_bench_file ${ip_path}/example_designs/bfm_design/OFDM_Controller_v0_1_tb.v
set interface_address_vh_file ""

# Set IP Repository and Update IP Catalogue 
set repo_paths [get_property ip_repo_paths [current_fileset]] 
if { [lsearch -exact -nocase $repo_paths $ip_path ] == -1 } {
	set_property ip_repo_paths "$ip_path [get_property ip_repo_paths [current_fileset]]" [current_fileset]
	update_ip_catalog
}

set design_name ""
set all_bd {}
set all_bd_files [get_files *.bd -quiet]
foreach file $all_bd_files {
set file_name [string range $file [expr {[string last "/" $file] + 1}] end]
set bd_name [string range $file_name 0 [expr {[string last "." $file_name] -1}]]
lappend all_bd $bd_name
}

for { set i 1 } { 1 } { incr i } {
	set design_name "OFDM_Controller_v0_1_bfm_${i}"
	if { [lsearch -exact -nocase $all_bd $design_name ] == -1 } {
		break
	}
}

create_ipi_design interface_address_vh_file ${design_name}
validate_bd_design

set wrapper_file [make_wrapper -files [get_files ${design_name}.bd] -top -force]
import_files -force -norecurse $wrapper_file

set_property SOURCE_SET sources_1 [get_filesets sim_1]
import_files -fileset sim_1 -norecurse -force $test_bench_file
remove_files -quiet -fileset sim_1 OFDM_Controller_v0_1_tb_include.vh
import_files -fileset sim_1 -norecurse -force $interface_address_vh_file
set_property top OFDM_Controller_v0_1_tb [get_filesets sim_1]
set_property top_lib {} [get_filesets sim_1]
set_property top_file {} [get_filesets sim_1]
launch_xsim -simset sim_1 -mode behavioral
restart
run 1000 us
