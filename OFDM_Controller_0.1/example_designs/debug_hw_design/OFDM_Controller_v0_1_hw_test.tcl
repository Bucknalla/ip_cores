# Runtime Tcl commands to interact with - OFDM_Controller_v0_1

# Sourcing design address info tcl
set bd_path [get_property DIRECTORY [current_project]]/[current_project].srcs/[current_fileset]/bd
source ${bd_path}/OFDM_Controller_v0_1_include.tcl

# jtag axi master interface hardware name, change as per your design.
set jtag_axi_master hw_axi_1
set ec 0

# hw test script
# Delete all previous axis transactions
if { [llength [get_hw_axi_txns -quiet]] } {
	delete_hw_axi_txn [get_hw_axi_txns -quiet]
}


# Test all lite slaves.
set wdata_1 abcd1234

# Test: S00_AXI
# Create a write transaction at s00_axi_addr address
create_hw_axi_txn w_s00_axi_addr [get_hw_axis $jtag_axi_master] -type write -address $s00_axi_addr -data $wdata_1
# Create a read transaction at s00_axi_addr address
create_hw_axi_txn r_s00_axi_addr [get_hw_axis $jtag_axi_master] -type read -address $s00_axi_addr
# Initiate transactions
run_hw_axi r_s00_axi_addr
run_hw_axi w_s00_axi_addr
run_hw_axi r_s00_axi_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_s00_axi_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - S00_AXI"
} else {
	puts "Data comparison test fail for - S00_AXI, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Test: S_AXI_INTR
set intr_test 0                                                                                             
# Global interrupt register address                                                                                
set glob_intr_reg $s_axi_intr_addr                                                                                 
# interrupt enable register address                                                                                
set intr_en_reg [format 0x%x [expr {$s_axi_intr_addr + 0x4}]]                                                     
# status register address                                                                                          
set sts_reg [format 0x%x [expr {$s_axi_intr_addr + 0x8}]]                                                         
# interrupt acknowledgement register address                                                                       
set intr_ack_reg [format 0x%x [expr {$s_axi_intr_addr + 0xC}]]                                                    
# pending register address                                                                                         
set pending_reg [format 0x%x [expr {$s_axi_intr_addr + 0x10}]]                                                     

# create a write transaction at global intr en reg                                                          
create_hw_axi_txn glob_intr_w [get_hw_axis $jtag_axi_master] -type write -address $glob_intr_reg  -data {00000001} 
# create a read transaction at global intr en reg                                                                  
create_hw_axi_txn glob_intr_r [get_hw_axis $jtag_axi_master] -type read -address $glob_intr_reg                    
# Enable global intr enable                                                                                        
run_hw_axi glob_intr_w                                                                                             
run_hw_axi glob_intr_r                                                                                             
set rdata_tmp [get_property DATA [get_hw_axi_txn glob_intr_r]]                                                     
if { $rdata_tmp != 00000001 } {                                                                                    
	puts "S_AXI_INTR - global intr enable register not set, expected-00000001 actual-$rdata_tmp"                 
	inc intr_test                                                                                                  
}                                                                                                                  

# create a write transaction at intr en reg                                                                 
create_hw_axi_txn intr_en_w [get_hw_axis $jtag_axi_master] -type write -address $intr_en_reg  -data {00000001}     
# create a read transaction at intr en reg                                                                         
create_hw_axi_txn intr_en_r [get_hw_axis $jtag_axi_master] -type read -address $intr_en_reg                        
# Enable intr by writing to bit 0 of intr reg [0]                                                                  
run_hw_axi intr_en_w                                                                                               
run_hw_axi intr_en_r                                                                                               
set rdata_tmp [get_property DATA [get_hw_axi_txn intr_en_r]]                                                       
if { $rdata_tmp != 00000001 } {                                                                                    
	puts "S_AXI_INTR - intr enable register not set, expected-00000001 actual-$rdata_tmp"                        
	inc intr_test                                                                                                  
}                                                                                                                  

# create a read transaction at intr sts reg                                                                 
create_hw_axi_txn sts_r [get_hw_axis $jtag_axi_master] -type read -address $sts_reg                                
# Read intr status reg. Bit 0 being 1 marks an intr condition has occurred. (should be 0x00000001)                 
run_hw_axi sts_r                                                                                                   
set rdata_tmp [get_property DATA [get_hw_axi_txn sts_r]]                                                           
if { $rdata_tmp != 00000001 } {                                                                                    
	puts "S_AXI_INTR - check status register, intr condition has not occurred, expected-00000001 actual-$rdata_tmp"
	inc intr_test                                                                                                  
}                                                                                                                  

# create a read transaction at pending reg                                                                  
create_hw_axi_txn pending_r [get_hw_axis $jtag_axi_master] -type read -address $pending_reg                        
# Read pending reg bit 0 (should be 0x00000001)                                                                    
run_hw_axi pending_r                                                                                               
set rdata_tmp [get_property DATA [get_hw_axi_txn pending_r]]                                                       
if { $rdata_tmp != 00000001 } {                                                                                    
	puts "S_AXI_INTR - Read pending reg bit 0, expected-00000001 actual-$rdata_tmp"                              
	inc intr_test                                                                                                  
}                                                                                                                  

# create a read transaction at gpio reg                                                                     
create_hw_axi_txn irq_r [get_hw_axis $jtag_axi_master] -type read -address $axi_gpio_irq_addr                      
# read gpio reg bit 0 to see if IRQ has been captured                                                              
run_hw_axi irq_r                                                                                                   
set rdata_tmp [get_property DATA [get_hw_axi_txn irq_r]]                                                           
if { $rdata_tmp != 00000001 } {                                                                                    
	puts "S_AXI_INTR - Read pending reg bit 0 to check if IRQ has been captured, expected-00000001 actual-$rdata_tmp"
	inc intr_test                                                                                                  
}                                                                                                                 

# Once intr has been detected, disable the intr enable reg bit 0 and acknowledge the interrupt by writing 1 to bit 0
set_property DATA 00000000 [get_hw_axi_txn intr_en_w]                                                              
run_hw_axi intr_en_w                                                                                               

# create a write transaction at intr ack reg                                                                
create_hw_axi_txn intr_ack_w [get_hw_axis $jtag_axi_master] -type write -address $intr_ack_reg  -data {00000001}   
#acknowledgement                                                                                                   
run_hw_axi intr_ack_w                                                                                              

# Read pending reg to see if there are no pending reg (should be 0x00000000)                                
run_hw_axi pending_r                                                                                               
set rdata_tmp [get_property DATA [get_hw_axi_txn pending_r]]                                                       
if { $rdata_tmp != 00000000 } {                                                                                    
	puts "S_AXI_INTR - Read pending reg, expected-00000000 actual-$rdata_tmp"                                    
	inc intr_test                                                                                                  
}                                                                                                                  

# Read gpio reg to see the IRQ has been cleared (should be 0x00000000)                                      
run_hw_axi irq_r                                                                                                   
set rdata_tmp [get_property DATA [get_hw_axi_txn irq_r]]                                                           
if { $rdata_tmp != 00000000 } {                                                                                    
	puts "S_AXI_INTR - Check if IRQ has been cleared, expected-00000000 actual-$rdata_tmp"                       
	inc intr_test                                                                                                  
}                                                                                                                  

# Compare read data                                                                                         
if { $intr_test == 0 } {                                                                                           
	puts "Test pass for - S_AXI_INTR"                                                                            
} else {                                                                                                           
	puts "Test fail for - S_AXI_INTR"                                                                            
	inc ec                                                                                                         
}


# Master Tests..
# CIP Master performs write and read transaction followed by data comparison. 
# To initiate the master "init_axi_txn" port needs to be asserted high. The same assertion is done by axi_gpio_out driven by jtag_axi_lite master.
# Writing 32'b1 to axi_gpio_out reg will initiate the first master. Subsequent masters will take following gpio bits.
# Master 0 init_axi_txn is controlled by bit_0 of axi_gpio_out while bit_1 initiates Master 1.

# To monitor the result of the data comparison by Master 0, error and done flags are being monitored by axi_gpio_in.
# Reading bit 0 of gpio_1_reg gives the done status of the master transaction while bit 1 gives the error
# status of the transaction initiated by the master. bit_0 being '1' means the transaction is complete 
# while bit_1 being 1 means the transaction is completed with error. The status of subsequent masters 
# will take up higher order bits in the same order. Master 1 has bit_2 as done bit, bit_3 as error bit. 

# Utility procs
proc get_done_and_error_bit { rdata totmaster position } {
	# position can be 0 1 2 3 ...
	# Always Done is at sequence of bit 0 & error is at bit 1 position.
	set hexdata [string range $rdata 0 7 ]
	# In case of 64 bit data width 
	#set hexdata [string range $rdata 8 15 ]
	binary scan [binary format H* $hexdata] B* bindata
	set bindata [string range $bindata [expr 32 - $totmaster * 2] 31 ]
	set DE [string range $bindata [ expr ($totmaster - ($position + 1) ) * 2 ] [expr ($totmaster - ($position + 1) ) * 2 + 1] ]
	return $DE
}

proc bin2hex {bin} {
	set result ""
	set prepend [string repeat 0 [expr (4-[string length $bin]%4)%4]]
	foreach g [regexp -all -inline {[01]{4}} $prepend$bin] {
		foreach {b3 b2 b1 b0} [split $g ""] {
			append result [format %X [expr {$b3*8+$b2*4+$b1*2+$b0}]]
		}
	}
	return $result
}

proc get_init_data { position } {
	# position can be 0, 1, 2, 3, 4...15
	set initbit 00000000000000000000000000000000
	set position [ expr 31 - $position ]
	set newinitbit [string replace $initbit $position $position 1]
	set hexdata [bin2hex $newinitbit]
	return $hexdata
}

# Test: M00_AXI
set wdata_m00_axi [get_init_data 0]
create_hw_axi_txn w_m00_axi_addr [get_hw_axis $jtag_axi_master] -type write -address $axi_gpio_out_addr -data ${wdata_m00_axi}
create_hw_axi_txn r_m00_axi_addr [get_hw_axis $jtag_axi_master] -type read -address $axi_gpio_in_addr 
# Initiate transactions
run_hw_axi r_m00_axi_addr
run_hw_axi w_m00_axi_addr
run_hw_axi r_m00_axi_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_m00_axi_addr]]
set DE [ get_done_and_error_bit $rdata_tmp 3 0 ]
# Compare read data
if { $DE == 01 } {
	puts "Data comparison test pass for - M00_AXI"
} else {
	puts "Data comparison test fail for - M00_AXI, rdata-$rdata_tmp expected-01 actual-$DE"
	inc ec
}

# Test: M01_AXI
set wdata_m01_axi [get_init_data 1]
create_hw_axi_txn w_m01_axi_addr [get_hw_axis $jtag_axi_master] -type write -address $axi_gpio_out_addr -data ${wdata_m01_axi}
create_hw_axi_txn r_m01_axi_addr [get_hw_axis $jtag_axi_master] -type read -address $axi_gpio_in_addr 
# Initiate transactions
run_hw_axi r_m01_axi_addr
run_hw_axi w_m01_axi_addr
run_hw_axi r_m01_axi_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_m01_axi_addr]]
set DE [ get_done_and_error_bit $rdata_tmp 3 1 ]
# Compare read data
if { $DE == 01 } {
	puts "Data comparison test pass for - M01_AXI"
} else {
	puts "Data comparison test fail for - M01_AXI, rdata-$rdata_tmp expected-01 actual-$DE"
	inc ec
}

# Test: M02_AXI
set wdata_m02_axi [get_init_data 2]
create_hw_axi_txn w_m02_axi_addr [get_hw_axis $jtag_axi_master] -type write -address $axi_gpio_out_addr -data ${wdata_m02_axi}
create_hw_axi_txn r_m02_axi_addr [get_hw_axis $jtag_axi_master] -type read -address $axi_gpio_in_addr 
# Initiate transactions
run_hw_axi r_m02_axi_addr
run_hw_axi w_m02_axi_addr
run_hw_axi r_m02_axi_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_m02_axi_addr]]
set DE [ get_done_and_error_bit $rdata_tmp 3 2 ]
# Compare read data
if { $DE == 01 } {
	puts "Data comparison test pass for - M02_AXI"
} else {
	puts "Data comparison test fail for - M02_AXI, rdata-$rdata_tmp expected-01 actual-$DE"
	inc ec
}

# Check error flag
if { $ec == 0 } {
	 puts "PTGEN_TEST: PASSED!" 
} else {
	 puts "PTGEN_TEST: FAILED!" 
}

