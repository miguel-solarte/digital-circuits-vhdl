## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 


	



##Buttons
#set_property PACKAGE_PIN U18 [get_ports sett]						
#	set_property IOSTANDARD LVCMOS33 [get_ports sett]
set_property PACKAGE_PIN T18 [get_ports rst]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst]
#set_property PACKAGE_PIN W19 [get_ports btnL]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#set_property PACKAGE_PIN T17 [get_ports btnR]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
	
#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {PULS_OUT[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_OUT[3]}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {PULS_OUT[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_OUT[2]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {PULS_OUT[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_OUT[1]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {PULS_OUT[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_OUT[0]}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {PULS_IN[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_IN[3]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {PULS_IN[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_IN[2]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {PULS_IN[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_IN[1]}]
#Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {PULS_IN[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {PULS_IN[0]}]
 

#Pmod Header JB
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {RS_RW[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RS_RW[0]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {RS_RW[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RS_RW[1]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports E]					
	set_property IOSTANDARD LVCMOS33 [get_ports E]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 


#Pmod Header JC
#Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {DB7_0[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[3]}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {DB7_0[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[2]}]
#Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {DB7_0[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[1]}]
#Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {DB7_0[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[0]}]
#Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {DB7_0[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[7]}]
#Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {DB7_0[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[6]}]
#Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports {DB7_0[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[5]}]
#Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {DB7_0[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {DB7_0[4]}]
