#Thiet lap cac duong dan
set LinkProject "/home/ltk/ASIC_TRAINING/LAB4_PT/"
set LinkLibrary_db "/home/ltk/ASIC_LIB/Lib/syn_lib/syn_lib/"
set LinkSDC "${LinkProject}/sdc"
set LinkReport "${LinkProject}/pt/pt_report"
set LinkNetlist "${LinkProject}/netlist"
#Thiet lap thu vien
set link_library [list * ${LinkLibrary_db}/saed90nm_min.db \
${LinkLibrary_db}/saed90nm_typ.db \
${LinkLibrary_db}/saed90nm_max.db]
set target_library [list ${LinkLibrary_db}/saed90nm_min.db \
${LinkLibrary_db}/saed90nm_typ.db \
${LinkLibrary_db}/saed90nm_max.db]
#Doc file netlist counter_NL.v
read_verilog ${LinkNetlist}/counter_NL.v
#Chi dinh top module can duoc thiet lap rang buoc
current_design counter
#doc file luu cac yeu cau rang buoc
source ${LinkSDC}/counter_SDC.sdc
fix_eco_timing -type hold -buffer_list {NBUFFX2 NBUFFX4 NBUFFX8 NBUFFX16 NBUFFX32}
#report cac loai duong du lieu
report_timing -max_paths 20 -from [all_inputs] -to [all_registers -data_pins] > ${LinkReport}/inputstoflops.rpt
report_timing -max_paths 20 -from [all_registers -clock_pins] -to [all_registers -data_pins] > ${LinkReport}/floptoflop.rpt
report_timing -max_paths 20 -from [all_registers -clock_pins] -to [all_outputs] > ${LinkReport}/floptoputputs.rpt
report_timing -max_paths 20 -from [all_inputs] -to [all_outputs] > ${LinkReport}/inputstooutputs.rpt
#report setup time va hold time
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type max > ${LinkReport}/setuptiming.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type min > ${LinkReport}/holdtiming.rpt
#report chuyen doi
report_timing -transition_time -capacitance -nets -input_pins -from [all_registers -clock_pins] -to [all_registers -data_pins] > ${LinkReport}/tran_captiming.rpt
