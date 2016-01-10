----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/01/14 00:19:02
-- Design Name: 
-- Module Name: pwm_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ip_pwm_out is
    Port ( 
    	reset_n			: in STD_LOGIC;
		clk				: in STD_LOGIC;    	
		pwm_hz 			: in STD_LOGIC_VECTOR (7 downto 0);
		pwm_dir 		: in STD_LOGIC;
		pwm_duty 		: in STD_LOGIC_VECTOR (7 downto 0);
		pwm_pin_duty 	: out STD_LOGIC;
		pwm_pin_dir 	: out STD_LOGIC
		);
end ip_pwm_out;

architecture Behavioral of ip_pwm_out is

	signal pwm_cnt_div		: std_logic_vector( 7 downto 0 );
	signal pwm_cnt_div_p	: std_logic;
	signal pwm_cnt_div_pp	: std_logic;
	
	signal pwm_cnt			: std_logic_vector( 7 downto 0 );
	signal pwm_cnt_p		: std_logic;
	
	signal pwm_pin_duty_p	: std_logic;
begin

	pwm_pin_duty	<= pwm_pin_duty_p;
	pwm_pin_dir		<= pwm_dir;
	
	-- PWM 분주 타이머 
	--
	process( clk ) is
	begin
		if rising_edge( clk ) then
			if reset_n = '0' then
				pwm_cnt_div <= ( others => '0' );
			else
				pwm_cnt_div <= pwm_cnt_div + 1;
			end if;		
		end if;
	end process;	

	process( clk ) is
	begin
		if rising_edge( clk ) then
			case pwm_hz is
				when x"00" => pwm_cnt_div_p <= pwm_cnt_div(0);	
				when x"01" => pwm_cnt_div_p <= pwm_cnt_div(1);	
				when x"02" => pwm_cnt_div_p <= pwm_cnt_div(2);	
				when x"03" => pwm_cnt_div_p <= pwm_cnt_div(3);	
				when x"04" => pwm_cnt_div_p <= pwm_cnt_div(4);	
				when x"05" => pwm_cnt_div_p <= pwm_cnt_div(5);	
				when x"06" => pwm_cnt_div_p <= pwm_cnt_div(6);	
				when x"07" => pwm_cnt_div_p <= pwm_cnt_div(7);	
				when others => pwm_cnt_div_p <= pwm_cnt_div(0);	
			end case;
			
			pwm_cnt_div_pp <= pwm_cnt_div_p;
			
			if pwm_cnt_div_pp = '0' and pwm_cnt_div_p = '1' then
				pwm_cnt_p <= '1';
			else
				pwm_cnt_p <= '0';
			end if;
		end if;
	end process;


	-- PWM 기본 타이머 
	--
	process( clk ) is
	begin
		if rising_edge( clk ) then
			if reset_n = '0' then
				pwm_cnt <= ( others => '0' );
			else
				if pwm_cnt_p = '1' then
					pwm_cnt <= pwm_cnt + 1;
				end if;
			end if;
		end if;
	end process;	


	-- PWM 출력 
	--
	process( clk ) is
	begin
		if rising_edge( clk ) then
			if reset_n = '0' then
				pwm_pin_duty_p <= '0';
			else
				if pwm_cnt < pwm_duty then
					if pwm_duty = x"00" then
						pwm_pin_duty_p <= '0';
					else
						pwm_pin_duty_p <= '1';
					end if;
				else
					if pwm_duty = x"FF" then
						pwm_pin_duty_p <= '1';
					else
						pwm_pin_duty_p <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;			

end Behavioral;
