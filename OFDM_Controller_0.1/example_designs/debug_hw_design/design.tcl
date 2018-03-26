
proc create_ipi_design { offsetfile design_name } {

	create_bd_design $design_name
	open_bd_design $design_name

	# Create and configure Clock/Reset
	create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz sys_clk_0
	create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset sys_reset_0

	#check if current_board is set, if true - figure out required clocks.
	set is_board_clock_found 0
	set is_board_reset_found 0
	set external_reset_port ""
	set external_clock_port ""

	if { [current_board_part -quiet] != "" } {

		#check if any reset interface exists in board.
		set board_reset [lindex [get_board_part_interfaces -filter { BUSDEF_NAME == reset_rtl && MODE == slave }] 0 ]
		if { $board_reset ne "" } {
			set is_board_reset_found 1
			apply_board_connection -board_interface $board_reset -ip_intf sys_clk_0/reset -diagram [current_bd_design]
			apply_board_connection -board_interface $board_reset -ip_intf sys_reset_0/ext_reset -diagram [current_bd_design]
			set external_rst [get_bd_ports -quiet -of_objects [get_bd_nets -quiet -of_objects [get_bd_pins -quiet sys_clk_0/reset]]]
			if { $external_rst ne "" } {
				set external_reset_port [get_property NAME $external_rst]
			}
		} else {
			send_msg "ptgen 51-200" WARNING "No reset interface found in current_board, Users may need to specify the location constraints manually."
		}

		# check for differential clock, exclude any special clocks which has TYPE property.
		set board_clock_busifs ""
		foreach busif [get_board_part_interfaces -filter "BUSDEF_NAME == diff_clock_rtl"] {
			set type [get_property PARAM.TYPE $busif]
			if { $type == "" } {
				set board_clock_busifs $busif
				break
			}
		}
		if { $board_clock_busifs ne "" } {
			apply_board_connection -board_interface $board_clock_busifs -ip_intf sys_clk_0/CLK_IN1_D -diagram [current_bd_design]
			set is_board_clock_found 1
		} else {
			# check for single ended clock
			set board_sclock_busifs [lindex [get_board_part_interfaces -filter "BUSDEF_NAME == clock_rtl"] 0 ]
			if { $board_sclock_busifs ne "" } {
			    apply_board_connection -board_interface $board_sclock_busifs -ip_intf sys_clk_0/clock_CLK_IN1 -diagram [current_bd_design]
				set external_clk [get_bd_ports -quiet -of_objects [get_bd_nets -quiet -of_objects [get_bd_pins -quiet sys_clk_0/clk_in1]]]
				if { $external_clk ne "" } {
					set external_clock_port [get_property NAME $external_clk]
				}
				set is_board_clock_found 1
			} else {
				send_msg "ptgen 51-200" WARNING "No clock interface found in current_board, Users may need to specify the location constraints manually."
			}
		}

	} else {
		send_msg "ptgen 51-201" WARNING "No board selected in current_project. Users may need to specify the location constraints manually."
	}

	#if there is no corresponding board interface found, assume constraints will be provided manually while pin planning.
	if { $is_board_reset_found == 0 } {
		create_bd_port -dir I -type rst reset_rtl
		set_property CONFIG.POLARITY [get_property CONFIG.POLARITY [get_bd_pins sys_clk_0/reset]] [get_bd_ports reset_rtl]
		connect_bd_net [get_bd_pins sys_reset_0/ext_reset_in] [get_bd_ports reset_rtl]
		connect_bd_net [get_bd_ports reset_rtl] [get_bd_pins sys_clk_0/reset]
		set external_reset_port reset_rtl
	}
	if { $is_board_clock_found == 0 } {
		create_bd_port -dir I -type clk clock_rtl
		connect_bd_net [get_bd_pins sys_clk_0/clk_in1] [get_bd_ports clock_rtl]
		set external_clock_port clock_rtl
	}

	#Avoid IPI DRC, make clock port synchronous to reset
	if { $external_clock_port ne "" && $external_reset_port ne "" } {
		set_property CONFIG.ASSOCIATED_RESET $external_reset_port [get_bd_ports $external_clock_port]
	}

	# Connect other sys_reset pins
	connect_bd_net [get_bd_pins sys_reset_0/slowest_sync_clk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins sys_clk_0/locked] [get_bd_pins sys_reset_0/dcm_locked]

	# Create instance: OFDM_Controller_0, and set properties
	set OFDM_Controller_0 [ create_bd_cell -type ip -vlnv user.org:user:OFDM_Controller:0.1 OFDM_Controller_0 ]

	# Create instance: jtag_axi_0, and set properties
	set jtag_axi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi jtag_axi_0 ]
	set_property -dict [list CONFIG.PROTOCOL {0}] [get_bd_cells jtag_axi_0]
	connect_bd_net [get_bd_pins jtag_axi_0/aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins jtag_axi_0/aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_peri_interconnect, and set properties
	set axi_peri_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_peri_interconnect ]
	connect_bd_net [get_bd_pins axi_peri_interconnect/ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/ARESETN] [get_bd_pins sys_reset_0/interconnect_aresetn]
	set_property -dict [ list CONFIG.NUM_SI {1}  ] $axi_peri_interconnect
	connect_bd_net [get_bd_pins axi_peri_interconnect/S00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/S00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins jtag_axi_0/M_AXI] [get_bd_intf_pins axi_peri_interconnect/S00_AXI]

	set_property -dict [ list CONFIG.NUM_MI {6} ] $axi_peri_interconnect
	connect_bd_net [get_bd_pins axi_peri_interconnect/M00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M01_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M01_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M02_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M02_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M03_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M03_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M04_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M04_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M05_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_peri_interconnect/M05_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_mem_interconnect, and set properties
	set axi_mem_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_mem_interconnect ]
	connect_bd_net [get_bd_pins axi_mem_interconnect/ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/ARESETN] [get_bd_pins sys_reset_0/interconnect_aresetn]
	set_property -dict [ list CONFIG.NUM_MI {1} ] $axi_mem_interconnect
	connect_bd_net [get_bd_pins axi_mem_interconnect/M00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/M00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]

	set_property -dict [ list CONFIG.NUM_SI {4} ] $axi_mem_interconnect
	connect_bd_net [get_bd_pins axi_mem_interconnect/S00_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S00_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S01_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S01_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S02_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S02_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S03_ACLK] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_mem_interconnect/S03_ARESETN] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S03_AXI] [get_bd_intf_pins axi_peri_interconnect/M02_AXI]

	# Create instance: axi_bram_ctrl_0, and set properties
	set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl axi_bram_ctrl_0 ]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
	connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_bram_0, and set properties
	set axi_bram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen axi_bram_0 ]
	set_property -dict [ list CONFIG.Memory_Type {True_Dual_Port_RAM}  ] $axi_bram_0
	connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_0/BRAM_PORTA]
	connect_bd_intf_net [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins axi_bram_0/BRAM_PORTB]

	# Create instance: axi_gpio_out, and set properties
	set axi_gpio_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_out ]
	set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_GPIO_WIDTH {3}  ] $axi_gpio_out
	connect_bd_net [get_bd_pins axi_gpio_out/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_gpio_out/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_gpio_out/S_AXI] [get_bd_intf_pins axi_peri_interconnect/M03_AXI]

	# Create instance: axi_gpio_in, and set properties
	set axi_gpio_in [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_in ]
	set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {6}  ] $axi_gpio_in
	connect_bd_net [get_bd_pins axi_gpio_in/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_gpio_in/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_gpio_in/S_AXI] [get_bd_intf_pins axi_peri_interconnect/M04_AXI]

	# Create instance: xlconcat_0, and set properties
	set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat xlconcat_0 ]
	set_property -dict [ list CONFIG.NUM_PORTS {6}  ] $xlconcat_0
	connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins axi_gpio_in/gpio_io_i]

	# Create slice hier block : slice_block, and set properties
	set oldCurInst [current_bd_instance .]
	set slice_block [create_bd_cell -type hier slice_block ]
	current_bd_instance $slice_block
	create_bd_pin -dir I -from 2 -to 0 Din 
	create_bd_pin -dir O -from 0 -to 0 Dout0
	set bit_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice bit_0 ]
	set_property -dict [ list CONFIG.DIN_TO {0} CONFIG.DIN_WIDTH {3}  ] $bit_0
	connect_bd_net [get_bd_pins Dout0 ] [get_bd_pins bit_0/Dout]
	connect_bd_net [get_bd_pins Din] [get_bd_pins bit_0/Din]
	create_bd_pin -dir O -from 0 -to 0 Dout1
	set bit_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice bit_1 ]
	set_property -dict [ list CONFIG.DIN_TO {1} CONFIG.DIN_WIDTH {3}  ] $bit_1
	connect_bd_net [get_bd_pins Dout1 ] [get_bd_pins bit_1/Dout]
	connect_bd_net [get_bd_pins Din] [get_bd_pins bit_1/Din]
	create_bd_pin -dir O -from 0 -to 0 Dout2
	set bit_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice bit_2 ]
	set_property -dict [ list CONFIG.DIN_TO {2} CONFIG.DIN_WIDTH {3}  ] $bit_2
	connect_bd_net [get_bd_pins Dout2 ] [get_bd_pins bit_2/Dout]
	connect_bd_net [get_bd_pins Din] [get_bd_pins bit_2/Din]
	current_bd_instance $oldCurInst
	connect_bd_net [get_bd_pins axi_gpio_out/gpio_io_o] [get_bd_pins slice_block/Din]

	# Connect all clock & reset of OFDM_Controller_0 slave interfaces..
	connect_bd_intf_net [get_bd_intf_pins axi_peri_interconnect/M00_AXI] [get_bd_intf_pins OFDM_Controller_0/S00_AXI]
	connect_bd_net [get_bd_pins OFDM_Controller_0/s00_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/s00_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_peri_interconnect/M01_AXI] [get_bd_intf_pins OFDM_Controller_0/S_AXI_INTR]
	connect_bd_net [get_bd_pins OFDM_Controller_0/s_axi_intr_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/s_axi_intr_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Connect all clock, reset & status pins of OFDM_Controller_0 master interfaces..
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S00_AXI] [get_bd_intf_pins OFDM_Controller_0/M00_AXI]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axi_txn_done] [get_bd_pins xlconcat_0/In0]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axi_error] [get_bd_pins xlconcat_0/In1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axi_init_axi_txn] [ get_bd_pins slice_block/Dout0 ]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S01_AXI] [get_bd_intf_pins OFDM_Controller_0/M01_AXI]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m01_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m01_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m01_axi_txn_done] [get_bd_pins xlconcat_0/In2]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m01_axi_error] [get_bd_pins xlconcat_0/In3]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m01_axi_init_axi_txn] [ get_bd_pins slice_block/Dout1 ]
	connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/S02_AXI] [get_bd_intf_pins OFDM_Controller_0/M02_AXI]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m02_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m02_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m02_axi_txn_done] [get_bd_pins xlconcat_0/In4]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m02_axi_error] [get_bd_pins xlconcat_0/In5]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m02_axi_init_axi_txn] [ get_bd_pins slice_block/Dout2 ]

	# Connect all clock & reset of OFDM_Controller_0 streaming interfaces..
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axis_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins OFDM_Controller_0/m00_axis_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]

	# Create instance: axi_gpio_irq, and set properties
	set axi_gpio_irq [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_irq ]
	set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {1} ] $axi_gpio_irq
	connect_bd_net [get_bd_pins axi_gpio_irq/s_axi_aclk] [get_bd_pins sys_clk_0/clk_out1]
	connect_bd_net [get_bd_pins axi_gpio_irq/s_axi_aresetn] [get_bd_pins sys_reset_0/peripheral_aresetn]
	connect_bd_intf_net [get_bd_intf_pins axi_gpio_irq/S_AXI] [get_bd_intf_pins axi_peri_interconnect/M05_AXI]
	connect_bd_net [get_bd_pins OFDM_Controller_0/irq] [get_bd_pins axi_gpio_irq/gpio_io_i]


	# Auto assign address
	assign_bd_address

	# Configure address param & range of OFDM_Controller_0 master interfaces..
	set_property range 16K [get_bd_addr_segs {jtag_axi_0/Data/SEG_axi_bram_ctrl_0_Mem0}]
	set_property range 16K [get_bd_addr_segs {OFDM_Controller_0/M00_AXI/SEG_axi_bram_ctrl_0_Mem0}]
	set_property range 16K [get_bd_addr_segs {OFDM_Controller_0/M01_AXI/SEG_axi_bram_ctrl_0_Mem0}]
	set_property range 16K [get_bd_addr_segs {OFDM_Controller_0/M02_AXI/SEG_axi_bram_ctrl_0_Mem0}]
	set_property -dict [list  CONFIG.C_M00_AXI_TARGET_SLAVE_BASE_ADDR {0xC0000000} CONFIG.C_M01_AXI_TARGET_SLAVE_BASE_ADDR {0xC0000100} CONFIG.C_M02_AXI_TARGET_SLAVE_BASE_ADDR {0xC0000200} ] [get_bd_cells OFDM_Controller_0]

	# Copy all address to OFDM_Controller_v0_1_include.tcl file
	set bd_path [get_property DIRECTORY [current_project]]/[current_project].srcs/[current_fileset]/bd
	upvar 1 $offsetfile offset_file
	set offset_file "${bd_path}/OFDM_Controller_v0_1_include.tcl"
	set fp [open $offset_file "w"]
	puts $fp "# Configuration address parameters"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_axi_gpio_in_Reg ]]
	puts $fp "set axi_gpio_in_addr ${offset}"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_axi_gpio_irq_Reg ]]
	puts $fp "set axi_gpio_irq_addr ${offset}"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_axi_gpio_out_Reg ]]
	puts $fp "set axi_gpio_out_addr ${offset}"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_OFDM_Controller_0_S00_AXI_* ]]
	puts $fp "set s00_axi_addr ${offset}"

	set offset [get_property OFFSET [get_bd_addr_segs /jtag_axi_0/Data/SEG_OFDM_Controller_0_S_AXI_INTR_* ]]
	puts $fp "set s_axi_intr_addr ${offset}"

	close $fp
}

# Set IP Repository and Update IP Catalogue 
set ip_path [file dirname [file normalize [get_property XML_FILE_NAME [ipx::get_cores user.org:user:OFDM_Controller:0.1]]]]
set hw_test_file ${ip_path}/example_designs/debug_hw_design/OFDM_Controller_v0_1_hw_test.tcl

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
	set design_name "OFDM_Controller_v0_1_hw_${i}"
	if { [lsearch -exact -nocase $all_bd $design_name ] == -1 } {
		break
	}
}

set intf_address_include_file ""
create_ipi_design intf_address_include_file ${design_name}
save_bd_design
validate_bd_design

set wrapper_file [make_wrapper -files [get_files ${design_name}.bd] -top -force]
import_files -force -norecurse $wrapper_file

puts "-------------------------------------------------------------------------------------------------"
puts "INFO NEXT STEPS : Until this stage, debug hardware design has been created, "
puts "   please perform following steps to test design in targeted board."
puts "1. Generate bitstream"
puts "2. Setup your targeted board, open hardware manager and open new(or existing) hardware target"
puts "3. Download generated bitstream"
puts "4. Run generated hardware test using below command, this invokes basic read/write operation"
puts "   to every interface present in the peripheral : xilinx.com:user:myip:1.0"
puts "   : source -notrace ${hw_test_file}"
puts "-------------------------------------------------------------------------------------------------"

