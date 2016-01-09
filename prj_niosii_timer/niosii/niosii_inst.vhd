	component niosii is
		port (
			clk_clk                          : in  std_logic                    := 'X'; -- clk
			pio_0_external_connection_export : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n                    : in  std_logic                    := 'X'; -- reset_n
			uart_0_rxd                       : in  std_logic                    := 'X'; -- rxd
			uart_0_txd                       : out std_logic                            -- txd
		);
	end component niosii;

	u0 : component niosii
		port map (
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                       clk.clk
			pio_0_external_connection_export => CONNECTED_TO_pio_0_external_connection_export, -- pio_0_external_connection.export
			reset_reset_n                    => CONNECTED_TO_reset_reset_n,                    --                     reset.reset_n
			uart_0_rxd                       => CONNECTED_TO_uart_0_rxd,                       --                    uart_0.rxd
			uart_0_txd                       => CONNECTED_TO_uart_0_txd                        --                          .txd
		);

