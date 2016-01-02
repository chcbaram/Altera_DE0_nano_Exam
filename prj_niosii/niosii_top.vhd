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



-- Library Define
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;





entity niosii_top is
    Port ( 
		p_clk_50Mhz		: in  std_logic;    	
		
		p_button		: in  std_logic_vector( 1 downto 0 );
		p_led_out		: out std_logic_vector( 7 downto 0 )
		);
end niosii_top;


architecture Behavioral of niosii_top is


    component niosii is
        port (
            clk_clk                            : in  std_logic                    := 'X'; -- clk
            pio_0_external_connection_export   : out std_logic_vector(7 downto 0);        -- export
            reset_reset_n                      : in  std_logic                    := 'X'  -- reset_n
        );
    end component niosii;

		
	signal s_reset_n			: std_logic;
begin

	s_reset_n <= p_button(0);
	

    u0 : component niosii
        port map (
            clk_clk                          => p_clk_50Mhz,
            pio_0_external_connection_export => p_led_out,
            reset_reset_n                    => s_reset_n
        );	

end Behavioral;
