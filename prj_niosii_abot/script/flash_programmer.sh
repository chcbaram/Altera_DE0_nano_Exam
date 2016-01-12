#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: C:\FPGA\DE0_nano\Altera_DE0_nano_Exam\prj_niosii_abot\output_files\niosii_top.sof to: "..\flash/niosii_top_epcs_flash_controller_0.flash"
#
sof2flash --input="C:/FPGA/DE0_nano/Altera_DE0_nano_Exam/prj_niosii_abot/output_files/niosii_top.sof" --output="../flash/niosii_top_epcs_flash_controller_0.flash" --epcs --verbose 

#
# Programming File: "..\flash/niosii_top_epcs_flash_controller_0.flash" To Device: epcs_flash_controller_0
#
nios2-flash-programmer "../flash/niosii_top_epcs_flash_controller_0.flash" --base=0x21000 --epcs --accept-bad-sysid --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

