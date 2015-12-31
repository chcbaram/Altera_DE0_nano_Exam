-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "01/01/2016 03:40:58"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	led_top IS
    PORT (
	p_clk_50Mhz : IN std_logic;
	p_button : IN std_logic_vector(1 DOWNTO 0);
	p_led_out : BUFFER std_logic
	);
END led_top;

-- Design Ports Information
-- p_button[1]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p_led_out	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- p_button[0]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- p_clk_50Mhz	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF led_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_p_clk_50Mhz : std_logic;
SIGNAL ww_p_button : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_p_led_out : std_logic;
SIGNAL \s_clk_1Khz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \p_clk_50Mhz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \p_button[1]~input_o\ : std_logic;
SIGNAL \p_led_out~output_o\ : std_logic;
SIGNAL \p_clk_50Mhz~input_o\ : std_logic;
SIGNAL \p_clk_50Mhz~inputclkctrl_outclk\ : std_logic;
SIGNAL \p_button[0]~input_o\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[0]~16_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[0]~18_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[0]~17\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[1]~19_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[1]~20\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[2]~21_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[2]~22\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[3]~23_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[3]~24\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[4]~25_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[4]~26\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[5]~27_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[5]~28\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[6]~29_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[6]~30\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[7]~31_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[7]~32\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[8]~33_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[8]~34\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[9]~35_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[9]~36\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[10]~37_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[10]~38\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[11]~39_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[11]~40\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[12]~41_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[12]~42\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[13]~43_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[13]~44\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[14]~45_combout\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[14]~46\ : std_logic;
SIGNAL \s_clk_50Mhz_cnt[15]~47_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \s_clk_1Khz~0_combout\ : std_logic;
SIGNAL \s_clk_1Khz~q\ : std_logic;
SIGNAL \s_clk_1Khz~clkctrl_outclk\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[0]~8_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[0]~9\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[1]~10_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[1]~11\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[2]~12_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[2]~13\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[3]~14_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[3]~15\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[4]~16_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[4]~17\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[5]~18_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[5]~19\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[6]~20_combout\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[6]~21\ : std_logic;
SIGNAL \s_clk_1Khz_cnt[7]~22_combout\ : std_logic;
SIGNAL s_clk_1Khz_cnt : std_logic_vector(15 DOWNTO 0);
SIGNAL s_clk_50Mhz_cnt : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_p_button[0]~input_o\ : std_logic;

BEGIN

ww_p_clk_50Mhz <= p_clk_50Mhz;
ww_p_button <= p_button;
p_led_out <= ww_p_led_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\s_clk_1Khz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \s_clk_1Khz~q\);

\p_clk_50Mhz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \p_clk_50Mhz~input_o\);
\ALT_INV_p_button[0]~input_o\ <= NOT \p_button[0]~input_o\;

-- Location: IOOBUF_X38_Y34_N16
\p_led_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_clk_1Khz_cnt(7),
	devoe => ww_devoe,
	o => \p_led_out~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\p_clk_50Mhz~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p_clk_50Mhz,
	o => \p_clk_50Mhz~input_o\);

-- Location: CLKCTRL_G18
\p_clk_50Mhz~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \p_clk_50Mhz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \p_clk_50Mhz~inputclkctrl_outclk\);

-- Location: IOIBUF_X53_Y14_N1
\p_button[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p_button(0),
	o => \p_button[0]~input_o\);

-- Location: LCCOMB_X51_Y23_N0
\s_clk_50Mhz_cnt[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[0]~16_combout\ = s_clk_50Mhz_cnt(0) $ (VCC)
-- \s_clk_50Mhz_cnt[0]~17\ = CARRY(s_clk_50Mhz_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(0),
	datad => VCC,
	combout => \s_clk_50Mhz_cnt[0]~16_combout\,
	cout => \s_clk_50Mhz_cnt[0]~17\);

-- Location: LCCOMB_X52_Y23_N2
\s_clk_50Mhz_cnt[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[0]~18_combout\ = (!\Equal0~4_combout\) # (!\p_button[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p_button[0]~input_o\,
	datad => \Equal0~4_combout\,
	combout => \s_clk_50Mhz_cnt[0]~18_combout\);

-- Location: FF_X51_Y23_N1
\s_clk_50Mhz_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[0]~16_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(0));

-- Location: LCCOMB_X51_Y23_N2
\s_clk_50Mhz_cnt[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[1]~19_combout\ = (s_clk_50Mhz_cnt(1) & (!\s_clk_50Mhz_cnt[0]~17\)) # (!s_clk_50Mhz_cnt(1) & ((\s_clk_50Mhz_cnt[0]~17\) # (GND)))
-- \s_clk_50Mhz_cnt[1]~20\ = CARRY((!\s_clk_50Mhz_cnt[0]~17\) # (!s_clk_50Mhz_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(1),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[0]~17\,
	combout => \s_clk_50Mhz_cnt[1]~19_combout\,
	cout => \s_clk_50Mhz_cnt[1]~20\);

-- Location: FF_X51_Y23_N3
\s_clk_50Mhz_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[1]~19_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(1));

-- Location: LCCOMB_X51_Y23_N4
\s_clk_50Mhz_cnt[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[2]~21_combout\ = (s_clk_50Mhz_cnt(2) & (\s_clk_50Mhz_cnt[1]~20\ $ (GND))) # (!s_clk_50Mhz_cnt(2) & (!\s_clk_50Mhz_cnt[1]~20\ & VCC))
-- \s_clk_50Mhz_cnt[2]~22\ = CARRY((s_clk_50Mhz_cnt(2) & !\s_clk_50Mhz_cnt[1]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(2),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[1]~20\,
	combout => \s_clk_50Mhz_cnt[2]~21_combout\,
	cout => \s_clk_50Mhz_cnt[2]~22\);

-- Location: FF_X51_Y23_N5
\s_clk_50Mhz_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[2]~21_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(2));

-- Location: LCCOMB_X51_Y23_N6
\s_clk_50Mhz_cnt[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[3]~23_combout\ = (s_clk_50Mhz_cnt(3) & (!\s_clk_50Mhz_cnt[2]~22\)) # (!s_clk_50Mhz_cnt(3) & ((\s_clk_50Mhz_cnt[2]~22\) # (GND)))
-- \s_clk_50Mhz_cnt[3]~24\ = CARRY((!\s_clk_50Mhz_cnt[2]~22\) # (!s_clk_50Mhz_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(3),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[2]~22\,
	combout => \s_clk_50Mhz_cnt[3]~23_combout\,
	cout => \s_clk_50Mhz_cnt[3]~24\);

-- Location: FF_X51_Y23_N7
\s_clk_50Mhz_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[3]~23_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(3));

-- Location: LCCOMB_X51_Y23_N8
\s_clk_50Mhz_cnt[4]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[4]~25_combout\ = (s_clk_50Mhz_cnt(4) & (\s_clk_50Mhz_cnt[3]~24\ $ (GND))) # (!s_clk_50Mhz_cnt(4) & (!\s_clk_50Mhz_cnt[3]~24\ & VCC))
-- \s_clk_50Mhz_cnt[4]~26\ = CARRY((s_clk_50Mhz_cnt(4) & !\s_clk_50Mhz_cnt[3]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(4),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[3]~24\,
	combout => \s_clk_50Mhz_cnt[4]~25_combout\,
	cout => \s_clk_50Mhz_cnt[4]~26\);

-- Location: FF_X51_Y23_N9
\s_clk_50Mhz_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[4]~25_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(4));

-- Location: LCCOMB_X51_Y23_N10
\s_clk_50Mhz_cnt[5]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[5]~27_combout\ = (s_clk_50Mhz_cnt(5) & (!\s_clk_50Mhz_cnt[4]~26\)) # (!s_clk_50Mhz_cnt(5) & ((\s_clk_50Mhz_cnt[4]~26\) # (GND)))
-- \s_clk_50Mhz_cnt[5]~28\ = CARRY((!\s_clk_50Mhz_cnt[4]~26\) # (!s_clk_50Mhz_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(5),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[4]~26\,
	combout => \s_clk_50Mhz_cnt[5]~27_combout\,
	cout => \s_clk_50Mhz_cnt[5]~28\);

-- Location: FF_X51_Y23_N11
\s_clk_50Mhz_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[5]~27_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(5));

-- Location: LCCOMB_X51_Y23_N12
\s_clk_50Mhz_cnt[6]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[6]~29_combout\ = (s_clk_50Mhz_cnt(6) & (\s_clk_50Mhz_cnt[5]~28\ $ (GND))) # (!s_clk_50Mhz_cnt(6) & (!\s_clk_50Mhz_cnt[5]~28\ & VCC))
-- \s_clk_50Mhz_cnt[6]~30\ = CARRY((s_clk_50Mhz_cnt(6) & !\s_clk_50Mhz_cnt[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(6),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[5]~28\,
	combout => \s_clk_50Mhz_cnt[6]~29_combout\,
	cout => \s_clk_50Mhz_cnt[6]~30\);

-- Location: FF_X51_Y23_N13
\s_clk_50Mhz_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[6]~29_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(6));

-- Location: LCCOMB_X51_Y23_N14
\s_clk_50Mhz_cnt[7]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[7]~31_combout\ = (s_clk_50Mhz_cnt(7) & (!\s_clk_50Mhz_cnt[6]~30\)) # (!s_clk_50Mhz_cnt(7) & ((\s_clk_50Mhz_cnt[6]~30\) # (GND)))
-- \s_clk_50Mhz_cnt[7]~32\ = CARRY((!\s_clk_50Mhz_cnt[6]~30\) # (!s_clk_50Mhz_cnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(7),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[6]~30\,
	combout => \s_clk_50Mhz_cnt[7]~31_combout\,
	cout => \s_clk_50Mhz_cnt[7]~32\);

-- Location: FF_X51_Y23_N15
\s_clk_50Mhz_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[7]~31_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(7));

-- Location: LCCOMB_X51_Y23_N16
\s_clk_50Mhz_cnt[8]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[8]~33_combout\ = (s_clk_50Mhz_cnt(8) & (\s_clk_50Mhz_cnt[7]~32\ $ (GND))) # (!s_clk_50Mhz_cnt(8) & (!\s_clk_50Mhz_cnt[7]~32\ & VCC))
-- \s_clk_50Mhz_cnt[8]~34\ = CARRY((s_clk_50Mhz_cnt(8) & !\s_clk_50Mhz_cnt[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(8),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[7]~32\,
	combout => \s_clk_50Mhz_cnt[8]~33_combout\,
	cout => \s_clk_50Mhz_cnt[8]~34\);

-- Location: FF_X51_Y23_N17
\s_clk_50Mhz_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[8]~33_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(8));

-- Location: LCCOMB_X51_Y23_N18
\s_clk_50Mhz_cnt[9]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[9]~35_combout\ = (s_clk_50Mhz_cnt(9) & (!\s_clk_50Mhz_cnt[8]~34\)) # (!s_clk_50Mhz_cnt(9) & ((\s_clk_50Mhz_cnt[8]~34\) # (GND)))
-- \s_clk_50Mhz_cnt[9]~36\ = CARRY((!\s_clk_50Mhz_cnt[8]~34\) # (!s_clk_50Mhz_cnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(9),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[8]~34\,
	combout => \s_clk_50Mhz_cnt[9]~35_combout\,
	cout => \s_clk_50Mhz_cnt[9]~36\);

-- Location: FF_X51_Y23_N19
\s_clk_50Mhz_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[9]~35_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(9));

-- Location: LCCOMB_X51_Y23_N20
\s_clk_50Mhz_cnt[10]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[10]~37_combout\ = (s_clk_50Mhz_cnt(10) & (\s_clk_50Mhz_cnt[9]~36\ $ (GND))) # (!s_clk_50Mhz_cnt(10) & (!\s_clk_50Mhz_cnt[9]~36\ & VCC))
-- \s_clk_50Mhz_cnt[10]~38\ = CARRY((s_clk_50Mhz_cnt(10) & !\s_clk_50Mhz_cnt[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(10),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[9]~36\,
	combout => \s_clk_50Mhz_cnt[10]~37_combout\,
	cout => \s_clk_50Mhz_cnt[10]~38\);

-- Location: FF_X51_Y23_N21
\s_clk_50Mhz_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[10]~37_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(10));

-- Location: LCCOMB_X51_Y23_N22
\s_clk_50Mhz_cnt[11]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[11]~39_combout\ = (s_clk_50Mhz_cnt(11) & (!\s_clk_50Mhz_cnt[10]~38\)) # (!s_clk_50Mhz_cnt(11) & ((\s_clk_50Mhz_cnt[10]~38\) # (GND)))
-- \s_clk_50Mhz_cnt[11]~40\ = CARRY((!\s_clk_50Mhz_cnt[10]~38\) # (!s_clk_50Mhz_cnt(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(11),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[10]~38\,
	combout => \s_clk_50Mhz_cnt[11]~39_combout\,
	cout => \s_clk_50Mhz_cnt[11]~40\);

-- Location: FF_X51_Y23_N23
\s_clk_50Mhz_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[11]~39_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(11));

-- Location: LCCOMB_X51_Y23_N24
\s_clk_50Mhz_cnt[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[12]~41_combout\ = (s_clk_50Mhz_cnt(12) & (\s_clk_50Mhz_cnt[11]~40\ $ (GND))) # (!s_clk_50Mhz_cnt(12) & (!\s_clk_50Mhz_cnt[11]~40\ & VCC))
-- \s_clk_50Mhz_cnt[12]~42\ = CARRY((s_clk_50Mhz_cnt(12) & !\s_clk_50Mhz_cnt[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(12),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[11]~40\,
	combout => \s_clk_50Mhz_cnt[12]~41_combout\,
	cout => \s_clk_50Mhz_cnt[12]~42\);

-- Location: FF_X51_Y23_N25
\s_clk_50Mhz_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[12]~41_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(12));

-- Location: LCCOMB_X51_Y23_N26
\s_clk_50Mhz_cnt[13]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[13]~43_combout\ = (s_clk_50Mhz_cnt(13) & (!\s_clk_50Mhz_cnt[12]~42\)) # (!s_clk_50Mhz_cnt(13) & ((\s_clk_50Mhz_cnt[12]~42\) # (GND)))
-- \s_clk_50Mhz_cnt[13]~44\ = CARRY((!\s_clk_50Mhz_cnt[12]~42\) # (!s_clk_50Mhz_cnt(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(13),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[12]~42\,
	combout => \s_clk_50Mhz_cnt[13]~43_combout\,
	cout => \s_clk_50Mhz_cnt[13]~44\);

-- Location: FF_X51_Y23_N27
\s_clk_50Mhz_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[13]~43_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(13));

-- Location: LCCOMB_X51_Y23_N28
\s_clk_50Mhz_cnt[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[14]~45_combout\ = (s_clk_50Mhz_cnt(14) & (\s_clk_50Mhz_cnt[13]~44\ $ (GND))) # (!s_clk_50Mhz_cnt(14) & (!\s_clk_50Mhz_cnt[13]~44\ & VCC))
-- \s_clk_50Mhz_cnt[14]~46\ = CARRY((s_clk_50Mhz_cnt(14) & !\s_clk_50Mhz_cnt[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_50Mhz_cnt(14),
	datad => VCC,
	cin => \s_clk_50Mhz_cnt[13]~44\,
	combout => \s_clk_50Mhz_cnt[14]~45_combout\,
	cout => \s_clk_50Mhz_cnt[14]~46\);

-- Location: FF_X51_Y23_N29
\s_clk_50Mhz_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[14]~45_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(14));

-- Location: LCCOMB_X51_Y23_N30
\s_clk_50Mhz_cnt[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_50Mhz_cnt[15]~47_combout\ = s_clk_50Mhz_cnt(15) $ (\s_clk_50Mhz_cnt[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(15),
	cin => \s_clk_50Mhz_cnt[14]~46\,
	combout => \s_clk_50Mhz_cnt[15]~47_combout\);

-- Location: FF_X51_Y23_N31
\s_clk_50Mhz_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	d => \s_clk_50Mhz_cnt[15]~47_combout\,
	sclr => \s_clk_50Mhz_cnt[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_50Mhz_cnt(15));

-- Location: LCCOMB_X52_Y23_N26
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (s_clk_50Mhz_cnt(13)) # ((s_clk_50Mhz_cnt(12)) # ((!s_clk_50Mhz_cnt(15)) # (!s_clk_50Mhz_cnt(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(13),
	datab => s_clk_50Mhz_cnt(12),
	datac => s_clk_50Mhz_cnt(14),
	datad => s_clk_50Mhz_cnt(15),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X52_Y23_N24
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (((!s_clk_50Mhz_cnt(0)) # (!s_clk_50Mhz_cnt(2))) # (!s_clk_50Mhz_cnt(3))) # (!s_clk_50Mhz_cnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(1),
	datab => s_clk_50Mhz_cnt(3),
	datac => s_clk_50Mhz_cnt(2),
	datad => s_clk_50Mhz_cnt(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X52_Y23_N4
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (s_clk_50Mhz_cnt(5)) # (((s_clk_50Mhz_cnt(4)) # (s_clk_50Mhz_cnt(7))) # (!s_clk_50Mhz_cnt(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(5),
	datab => s_clk_50Mhz_cnt(6),
	datac => s_clk_50Mhz_cnt(4),
	datad => s_clk_50Mhz_cnt(7),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X52_Y23_N18
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ((s_clk_50Mhz_cnt(11)) # ((s_clk_50Mhz_cnt(10)) # (!s_clk_50Mhz_cnt(8)))) # (!s_clk_50Mhz_cnt(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_50Mhz_cnt(9),
	datab => s_clk_50Mhz_cnt(11),
	datac => s_clk_50Mhz_cnt(8),
	datad => s_clk_50Mhz_cnt(10),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X52_Y23_N20
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~3_combout\) # ((\Equal0~0_combout\) # ((\Equal0~1_combout\) # (\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X52_Y23_N30
\s_clk_1Khz~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz~0_combout\ = \s_clk_1Khz~q\ $ (((\p_button[0]~input_o\ & !\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \p_button[0]~input_o\,
	datab => \s_clk_1Khz~q\,
	datad => \Equal0~4_combout\,
	combout => \s_clk_1Khz~0_combout\);

-- Location: FF_X52_Y23_N29
s_clk_1Khz : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \p_clk_50Mhz~inputclkctrl_outclk\,
	asdata => \s_clk_1Khz~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_clk_1Khz~q\);

-- Location: CLKCTRL_G8
\s_clk_1Khz~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \s_clk_1Khz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \s_clk_1Khz~clkctrl_outclk\);

-- Location: LCCOMB_X46_Y30_N6
\s_clk_1Khz_cnt[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[0]~8_combout\ = s_clk_1Khz_cnt(0) $ (VCC)
-- \s_clk_1Khz_cnt[0]~9\ = CARRY(s_clk_1Khz_cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_1Khz_cnt(0),
	datad => VCC,
	combout => \s_clk_1Khz_cnt[0]~8_combout\,
	cout => \s_clk_1Khz_cnt[0]~9\);

-- Location: FF_X46_Y30_N7
\s_clk_1Khz_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[0]~8_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(0));

-- Location: LCCOMB_X46_Y30_N8
\s_clk_1Khz_cnt[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[1]~10_combout\ = (s_clk_1Khz_cnt(1) & (!\s_clk_1Khz_cnt[0]~9\)) # (!s_clk_1Khz_cnt(1) & ((\s_clk_1Khz_cnt[0]~9\) # (GND)))
-- \s_clk_1Khz_cnt[1]~11\ = CARRY((!\s_clk_1Khz_cnt[0]~9\) # (!s_clk_1Khz_cnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_1Khz_cnt(1),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[0]~9\,
	combout => \s_clk_1Khz_cnt[1]~10_combout\,
	cout => \s_clk_1Khz_cnt[1]~11\);

-- Location: FF_X46_Y30_N9
\s_clk_1Khz_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[1]~10_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(1));

-- Location: LCCOMB_X46_Y30_N10
\s_clk_1Khz_cnt[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[2]~12_combout\ = (s_clk_1Khz_cnt(2) & (\s_clk_1Khz_cnt[1]~11\ $ (GND))) # (!s_clk_1Khz_cnt(2) & (!\s_clk_1Khz_cnt[1]~11\ & VCC))
-- \s_clk_1Khz_cnt[2]~13\ = CARRY((s_clk_1Khz_cnt(2) & !\s_clk_1Khz_cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_1Khz_cnt(2),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[1]~11\,
	combout => \s_clk_1Khz_cnt[2]~12_combout\,
	cout => \s_clk_1Khz_cnt[2]~13\);

-- Location: FF_X46_Y30_N11
\s_clk_1Khz_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[2]~12_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(2));

-- Location: LCCOMB_X46_Y30_N12
\s_clk_1Khz_cnt[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[3]~14_combout\ = (s_clk_1Khz_cnt(3) & (!\s_clk_1Khz_cnt[2]~13\)) # (!s_clk_1Khz_cnt(3) & ((\s_clk_1Khz_cnt[2]~13\) # (GND)))
-- \s_clk_1Khz_cnt[3]~15\ = CARRY((!\s_clk_1Khz_cnt[2]~13\) # (!s_clk_1Khz_cnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_clk_1Khz_cnt(3),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[2]~13\,
	combout => \s_clk_1Khz_cnt[3]~14_combout\,
	cout => \s_clk_1Khz_cnt[3]~15\);

-- Location: FF_X46_Y30_N13
\s_clk_1Khz_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[3]~14_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(3));

-- Location: LCCOMB_X46_Y30_N14
\s_clk_1Khz_cnt[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[4]~16_combout\ = (s_clk_1Khz_cnt(4) & (\s_clk_1Khz_cnt[3]~15\ $ (GND))) # (!s_clk_1Khz_cnt(4) & (!\s_clk_1Khz_cnt[3]~15\ & VCC))
-- \s_clk_1Khz_cnt[4]~17\ = CARRY((s_clk_1Khz_cnt(4) & !\s_clk_1Khz_cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_1Khz_cnt(4),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[3]~15\,
	combout => \s_clk_1Khz_cnt[4]~16_combout\,
	cout => \s_clk_1Khz_cnt[4]~17\);

-- Location: FF_X46_Y30_N15
\s_clk_1Khz_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[4]~16_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(4));

-- Location: LCCOMB_X46_Y30_N16
\s_clk_1Khz_cnt[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[5]~18_combout\ = (s_clk_1Khz_cnt(5) & (!\s_clk_1Khz_cnt[4]~17\)) # (!s_clk_1Khz_cnt(5) & ((\s_clk_1Khz_cnt[4]~17\) # (GND)))
-- \s_clk_1Khz_cnt[5]~19\ = CARRY((!\s_clk_1Khz_cnt[4]~17\) # (!s_clk_1Khz_cnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_1Khz_cnt(5),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[4]~17\,
	combout => \s_clk_1Khz_cnt[5]~18_combout\,
	cout => \s_clk_1Khz_cnt[5]~19\);

-- Location: FF_X46_Y30_N17
\s_clk_1Khz_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[5]~18_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(5));

-- Location: LCCOMB_X46_Y30_N18
\s_clk_1Khz_cnt[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[6]~20_combout\ = (s_clk_1Khz_cnt(6) & (\s_clk_1Khz_cnt[5]~19\ $ (GND))) # (!s_clk_1Khz_cnt(6) & (!\s_clk_1Khz_cnt[5]~19\ & VCC))
-- \s_clk_1Khz_cnt[6]~21\ = CARRY((s_clk_1Khz_cnt(6) & !\s_clk_1Khz_cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_clk_1Khz_cnt(6),
	datad => VCC,
	cin => \s_clk_1Khz_cnt[5]~19\,
	combout => \s_clk_1Khz_cnt[6]~20_combout\,
	cout => \s_clk_1Khz_cnt[6]~21\);

-- Location: FF_X46_Y30_N19
\s_clk_1Khz_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[6]~20_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(6));

-- Location: LCCOMB_X46_Y30_N20
\s_clk_1Khz_cnt[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_clk_1Khz_cnt[7]~22_combout\ = \s_clk_1Khz_cnt[6]~21\ $ (s_clk_1Khz_cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => s_clk_1Khz_cnt(7),
	cin => \s_clk_1Khz_cnt[6]~21\,
	combout => \s_clk_1Khz_cnt[7]~22_combout\);

-- Location: FF_X46_Y30_N21
\s_clk_1Khz_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \s_clk_1Khz~clkctrl_outclk\,
	d => \s_clk_1Khz_cnt[7]~22_combout\,
	sclr => \ALT_INV_p_button[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_clk_1Khz_cnt(7));

-- Location: IOIBUF_X0_Y16_N8
\p_button[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_p_button(1),
	o => \p_button[1]~input_o\);

ww_p_led_out <= \p_led_out~output_o\;
END structure;


