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
		p_led_out		: out std_logic_vector( 7 downto 0 );
		
        sdram_addr                       : out   std_logic_vector(12 downto 0);                    -- addr
        sdram_ba                         : out   std_logic_vector(1 downto 0);                     -- ba
        sdram_cas_n                      : out   std_logic;                                        -- cas_n
        sdram_cke                        : out   std_logic;                                        -- cke
        sdram_cs_n                       : out   std_logic;                                        -- cs_n
        sdram_dq                         : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
        sdram_dqm                        : out   std_logic_vector(1 downto 0);                     -- dqm
        sdram_ras_n                      : out   std_logic;                                        -- ras_n
        sdram_we_n                       : out   std_logic;                                        -- we_n
        sdram_clk_clk                    : out   std_logic                                         -- clk
		
		);
end niosii_top;


architecture Behavioral of niosii_top is

    component niosii is
        port (
            clk_clk                          : in    std_logic                     := 'X';             -- clk
            pio_0_external_connection_export : out   std_logic_vector(7 downto 0);                     -- export
            reset_reset_n                    : in    std_logic                     := 'X';             -- reset_n
            sdram_addr                       : out   std_logic_vector(12 downto 0);                    -- addr
            sdram_ba                         : out   std_logic_vector(1 downto 0);                     -- ba
            sdram_cas_n                      : out   std_logic;                                        -- cas_n
            sdram_cke                        : out   std_logic;                                        -- cke
            sdram_cs_n                       : out   std_logic;                                        -- cs_n
            sdram_dq                         : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            sdram_dqm                        : out   std_logic_vector(1 downto 0);                     -- dqm
            sdram_ras_n                      : out   std_logic;                                        -- ras_n
            sdram_we_n                       : out   std_logic;                                        -- we_n
            sdram_clk_clk                    : out   std_logic                                         -- clk
        );
    end component niosii;

		
	signal s_reset_n			: std_logic;
begin

	s_reset_n <= p_button(0);
	

    u0 : component niosii
        port map (
            clk_clk                          => p_clk_50Mhz,
            pio_0_external_connection_export => p_led_out,
            reset_reset_n                    => s_reset_n,
            sdram_addr                       => sdram_addr,                       --                     sdram.addr
            sdram_ba                         => sdram_ba,                         --                          .ba
            sdram_cas_n                      => sdram_cas_n,                      --                          .cas_n
            sdram_cke                        => sdram_cke,                        --                          .cke
            sdram_cs_n                       => sdram_cs_n,                       --                          .cs_n
            sdram_dq                         => sdram_dq,                         --                          .dq
            sdram_dqm                        => sdram_dqm,                        --                          .dqm
            sdram_ras_n                      => sdram_ras_n,                      --                          .ras_n
            sdram_we_n                       => sdram_we_n,                       --                          .we_n
            sdram_clk_clk                    => sdram_clk_clk                     --                 sdram_clk.clk
        );	
		
end Behavioral;
