###################################################################

# Created by write_sdc on Sun May  6 13:57:29 2018

###################################################################
set sdc_version 1.8

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max WORST -max_library saed90nm_max\
                         -min BEST -min_library saed90nm_min
create_clock [get_ports iClk]  -period 20  -waveform {0 10}
set_clock_latency 1  [get_clocks iClk]
set_clock_uncertainty 1  [get_clocks iClk]
set_clock_transition -rise 1 [get_clocks iClk]
set_clock_transition -fall 1 [get_clocks iClk]
set_input_delay -clock iClk  14  [get_ports iRst]
set_output_delay -clock iClk  14  [get_ports {oCount[7]}]
set_output_delay -clock iClk  14  [get_ports {oCount[6]}]
set_output_delay -clock iClk  14  [get_ports {oCount[5]}]
set_output_delay -clock iClk  14  [get_ports {oCount[4]}]
set_output_delay -clock iClk  14  [get_ports {oCount[3]}]
set_output_delay -clock iClk  14  [get_ports {oCount[2]}]
set_output_delay -clock iClk  14  [get_ports {oCount[1]}]
set_output_delay -clock iClk  14  [get_ports {oCount[0]}]
