----------------------------------------------------------------------------------
-- Design Name   : led_top
-- Create Date   : 2015/12/31
-- Module Name   : 
-- Project Name  : 
-- Target Devices: 
-- Tool Versions : 
-- Description   : 
-- Revision      :
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
--The MIT License (MIT)
--
--Copyright (c) 2015 
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.
----------------------------------------------------------------------------------



-- 라이브러리 선언
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;





entity led_top is
    Port ( 
		p_clk_50Mhz		: in  std_logic;    	
		
		p_button		: in  std_logic_vector( 1 downto 0 );
		p_led_out		: out std_logic
		);
end led_top;


architecture Behavioral of led_top is

	signal s_reset				: std_logic;
	signal s_clk_50Mhz_cnt		: std_logic_vector( 15 downto 0 );
	signal s_clk_1Khz			: std_logic								:= '0';
	signal s_clk_1Khz_cnt		: std_logic_vector( 15 downto 0 );
begin

	-- reset 신호 생성 
	-- 
	s_reset <= not p_button(0);
	
	
	-- 분주 타이머 
	--
	process( s_reset, p_clk_50Mhz ) is
	begin
		if rising_edge( p_clk_50Mhz ) then
			if s_reset = '1' then
				s_clk_50Mhz_cnt <= ( others => '0' );
			else
				if s_clk_50Mhz_cnt = (50000-1) then
					s_clk_1Khz      <= not s_clk_1Khz;
					s_clk_50Mhz_cnt <= ( others => '0' );
				else
					s_clk_50Mhz_cnt <= s_clk_50Mhz_cnt + 1;
				end if;
			end if;		
		end if;
	end process;	

	process( s_reset, s_clk_1Khz ) is
	begin
		if rising_edge( s_clk_1Khz ) then
			if s_reset = '1' then
				s_clk_1Khz_cnt <= ( others => '0' );
			else
				s_clk_1Khz_cnt <= s_clk_1Khz_cnt + 1;
			end if;					
		end if;
	end process;

	p_led_out <= s_clk_1Khz_cnt(7);


end Behavioral;
