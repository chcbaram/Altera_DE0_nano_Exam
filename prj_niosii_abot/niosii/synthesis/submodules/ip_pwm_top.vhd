-- new_component.vhd

-- This file was auto-generated as a prototype implementation of a module
-- created in component editor.  It ties off all outputs to ground and
-- ignores all inputs.  It needs to be edited to make it do something
-- useful.
-- 
-- This file will not be automatically regenerated.  You should check it in
-- to your version control system if you want to keep it.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ip_pwm_top is
	port (
		avs_s0_address     : in  std_logic_vector(7 downto 0)  := (others => '0'); -- avs_s0.address
		avs_s0_read        : in  std_logic                     := '0';             --       .read
		avs_s0_readdata    : out std_logic_vector(31 downto 0);                    --       .readdata
		avs_s0_write       : in  std_logic                     := '0';             --       .write
		avs_s0_writedata   : in  std_logic_vector(31 downto 0) := (others => '0'); --       .writedata
		avs_s0_waitrequest : out std_logic;                                        --       .waitrequest
		clock_clk          : in  std_logic                     := '0';             --  clock.clk
		reset_reset        : in  std_logic                     := '0';             --  reset.reset
		pwm_out            : out std_logic_vector(1 downto 0);                     --    pwm.pwm_signal
		pwm_dir            : out std_logic_vector(1 downto 0)                      --       .dir_signal
	);
end entity ip_pwm_top;

architecture rtl of ip_pwm_top is

	component ip_pwm_out is
    	port ( 
    	reset_n			: in STD_LOGIC;
    	clk				: in STD_LOGIC;
		pwm_hz 			: in STD_LOGIC_VECTOR (7 downto 0);
		pwm_dir 		: in STD_LOGIC;
		pwm_duty 		: in STD_LOGIC_VECTOR (7 downto 0);
		pwm_pin_duty 	: out STD_LOGIC;
		pwm_pin_dir 	: out STD_LOGIC
		);
	end component ip_pwm_out;
	
	signal reg_data_out	:std_logic_vector(31 downto 0);
	signal slv_reg0	:std_logic_vector(31 downto 0);
	signal slv_reg1	:std_logic_vector(31 downto 0);
	signal slv_reg2	:std_logic_vector(31 downto 0);
	signal slv_reg3	:std_logic_vector(31 downto 0);
	
begin

	-- TODO: Auto-generated HDL template

	process (clock_clk, reset_reset)
	variable loc_addr :std_logic_vector(7 downto 0); 
	begin
		if rising_edge(clock_clk) then 
			if reset_reset = '1' then
				slv_reg0 <= (others => '0');
				slv_reg1 <= (others => '0');
				slv_reg2 <= (others => '0');
				slv_reg3 <= (others => '0');
			else
				loc_addr := avs_s0_address(7 downto 0);
				if (avs_s0_write = '1') then
					case loc_addr is
					when x"00" =>
						slv_reg0 <= avs_s0_writedata;
					when x"01" =>
						slv_reg1 <= avs_s0_writedata;
					when x"02" =>
						slv_reg2 <= avs_s0_writedata;
					when x"03" =>
						slv_reg3 <= avs_s0_writedata;
					when others =>
						slv_reg0 <= slv_reg0;
						slv_reg1 <= slv_reg1;
						slv_reg2 <= slv_reg2;
						slv_reg3 <= slv_reg3;
					end case;
				end if;
			end if;
		end if;                   
	end process; 
	
	
	process (slv_reg0, slv_reg1, slv_reg2, slv_reg3)
	variable loc_addr :std_logic_vector(7 downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := avs_s0_address;
	    case loc_addr is
	      when x"00" =>
	        reg_data_out <= slv_reg0;
	      when x"01" =>
	        reg_data_out <= slv_reg1;
	      when x"02" =>
	        reg_data_out <= slv_reg2;
	      when x"03" =>
	        reg_data_out <= slv_reg3;
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 
	
	
	avs_s0_readdata <= reg_data_out;

	avs_s0_waitrequest <= '0';


	
PWM_0 : ip_pwm_out
    port map ( 
    	reset_n			=> not reset_reset,
    	clk				=> clock_clk,
		pwm_hz 			=> slv_reg0( 7 downto 0 ),
		pwm_dir 		=> slv_reg0( 8 ),
		pwm_duty 		=> slv_reg1( 7 downto 0 ),
		pwm_pin_duty 	=> pwm_out(0),
		pwm_pin_dir 	=> pwm_dir(0)
		);	
		
PWM_1 : ip_pwm_out
    port map ( 
    	reset_n			=> not reset_reset,
    	clk				=> clock_clk,
		pwm_hz 			=> slv_reg2( 7 downto 0 ),
		pwm_dir 		=> slv_reg2( 8 ),
		pwm_duty 		=> slv_reg3( 7 downto 0 ),
		pwm_pin_duty 	=> pwm_out(1),
		pwm_pin_dir 	=> pwm_dir(1)
		);	
		
end architecture rtl; -- of new_component
