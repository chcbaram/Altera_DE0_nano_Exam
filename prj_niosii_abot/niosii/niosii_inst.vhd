	component niosii is
		port (
			clk_clk                          : in  std_logic                    := 'X'; -- clk
			epcs_flash_dclk                  : out std_logic;                           -- dclk
			epcs_flash_sce                   : out std_logic;                           -- sce
			epcs_flash_sdo                   : out std_logic;                           -- sdo
			epcs_flash_data0                 : in  std_logic                    := 'X'; -- data0
			ip_pwm_dir                       : out std_logic_vector(1 downto 0);        -- dir
			ip_pwm_out                       : out std_logic_vector(1 downto 0);        -- out
			pio_0_external_connection_export : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n                    : in  std_logic                    := 'X'; -- reset_n
			uart_0_rxd                       : in  std_logic                    := 'X'; -- rxd
			uart_0_txd                       : out std_logic                            -- txd
		);
	end component niosii;

	u0 : component niosii
		port map (
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                       clk.clk
			epcs_flash_dclk                  => CONNECTED_TO_epcs_flash_dclk,                  --                epcs_flash.dclk
			epcs_flash_sce                   => CONNECTED_TO_epcs_flash_sce,                   --                          .sce
			epcs_flash_sdo                   => CONNECTED_TO_epcs_flash_sdo,                   --                          .sdo
			epcs_flash_data0                 => CONNECTED_TO_epcs_flash_data0,                 --                          .data0
			ip_pwm_dir                       => CONNECTED_TO_ip_pwm_dir,                       --                    ip_pwm.dir
			ip_pwm_out                       => CONNECTED_TO_ip_pwm_out,                       --                          .out
			pio_0_external_connection_export => CONNECTED_TO_pio_0_external_connection_export, -- pio_0_external_connection.export
			reset_reset_n                    => CONNECTED_TO_reset_reset_n,                    --                     reset.reset_n
			uart_0_rxd                       => CONNECTED_TO_uart_0_rxd,                       --                    uart_0.rxd
			uart_0_txd                       => CONNECTED_TO_uart_0_txd                        --                          .txd
		);

