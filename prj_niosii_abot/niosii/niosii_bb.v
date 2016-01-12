
module niosii (
	clk_clk,
	epcs_flash_dclk,
	epcs_flash_sce,
	epcs_flash_sdo,
	epcs_flash_data0,
	ip_pwm_dir,
	ip_pwm_out,
	pio_0_external_connection_export,
	reset_reset_n,
	uart_0_rxd,
	uart_0_txd);	

	input		clk_clk;
	output		epcs_flash_dclk;
	output		epcs_flash_sce;
	output		epcs_flash_sdo;
	input		epcs_flash_data0;
	output	[1:0]	ip_pwm_dir;
	output	[1:0]	ip_pwm_out;
	output	[7:0]	pio_0_external_connection_export;
	input		reset_reset_n;
	input		uart_0_rxd;
	output		uart_0_txd;
endmodule
