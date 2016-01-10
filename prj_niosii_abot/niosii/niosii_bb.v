
module niosii (
	clk_clk,
	pio_0_external_connection_export,
	reset_reset_n,
	uart_0_rxd,
	uart_0_txd,
	ip_pwm_dir,
	ip_pwm_out);	

	input		clk_clk;
	output	[7:0]	pio_0_external_connection_export;
	input		reset_reset_n;
	input		uart_0_rxd;
	output		uart_0_txd;
	output	[1:0]	ip_pwm_dir;
	output	[1:0]	ip_pwm_out;
endmodule
